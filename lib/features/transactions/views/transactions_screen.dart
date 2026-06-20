import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../core/services/fraud_detection_service.dart';
import '../../../models/match_model.dart';
import '../../../models/transaction_model.dart';
import '../../matching/providers/matching_provider.dart';

// ─── Transaction providers ─────────────────────────────────────────────────────

/// Stream of transactions where the user is either generator or company.
final transactionsForUserProvider =
    StreamProvider.family<List<TransactionModel>, String>((ref, uid) {
  final fs = FirebaseFirestore.instance;
  // Firestore can only do OR across separate queries; merge client-side
  final asGenerator = fs
      .collection(AppConfig.transactionsCollection)
      .where('generatorId', isEqualTo: uid)
      .snapshots()
      .map((s) => s.docs
          .map((d) => TransactionModel.fromJson({...d.data(), 'id': d.id}))
          .toList());
  return asGenerator;
});

final companyTransactionsProvider =
    StreamProvider.family<List<TransactionModel>, String>((ref, uid) {
  final fs = FirebaseFirestore.instance;
  return fs
      .collection(AppConfig.transactionsCollection)
      .where('companyId', isEqualTo: uid)
      .snapshots()
      .map((s) => s.docs
          .map((d) => TransactionModel.fromJson({...d.data(), 'id': d.id}))
          .toList());
});

// ─── Company Pending Matches Inbox ────────────────────────────────────────────

class CompanyMatchInboxScreen extends ConsumerWidget {
  final String companyId;
  const CompanyMatchInboxScreen({super.key, required this.companyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final matchesAsync = ref.watch(companyPendingMatchesProvider(companyId));

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('Match Requests'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: matchesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (matches) {
          if (matches.isEmpty) {
            return Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.inbox_rounded, size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text('No pending matches', style: Theme.of(context).textTheme.headlineSmall),
              ]),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: matches.length,
            itemBuilder: (ctx, i) => _CompanyMatchCard(match: matches[i]),
          );
        },
      ),
    );
  }
}

class _CompanyMatchCard extends ConsumerWidget {
  final MatchModel match;
  const _CompanyMatchCard({required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.recycling, color: cs.primary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Match Request', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text('Score: ${(match.matchScore * 100).toStringAsFixed(0)}%',
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
              ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('Transport', style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant)),
              Text(match.transportDecision,
                  style: tt.labelMedium?.copyWith(color: cs.primary, fontWeight: FontWeight.bold)),
            ]),
          ]),
          const Divider(height: 20),
          // Score breakdown
          ...match.scoreBreakdown.entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(children: [
              SizedBox(width: 68, child: Text(e.key, style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant))),
              Expanded(
                child: LinearProgressIndicator(
                  value: e.value.clamp(0.0, 1.0),
                  backgroundColor: cs.surfaceContainerHighest,
                  color: cs.primary,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 6),
              Text('${(e.value * 100).toStringAsFixed(0)}%', style: tt.labelSmall),
            ]),
          )),
          const SizedBox(height: 14),
          Row(children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => _respond(context, ref, 'declined'),
                icon: const Icon(Icons.close, size: 18),
                label: const Text('Decline'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: cs.error,
                  side: BorderSide(color: cs.error),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: FilledButton.icon(
                onPressed: () => _respond(context, ref, 'accepted'),
                icon: const Icon(Icons.check, size: 18),
                label: const Text('Accept'),
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }

  Future<void> _respond(BuildContext context, WidgetRef ref, String status) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConfig.matchesCollection)
          .doc(match.id)
          .update({'status': status});
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status == 'accepted' ? 'Match accepted!' : 'Match declined.'),
            backgroundColor: status == 'accepted' ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }
}

// ─── Weight Confirmation Screen ──────────────────────────────────────────────

class WeightConfirmationScreen extends ConsumerStatefulWidget {
  final TransactionModel transaction;
  final bool isGenerator; // true = generator confirming, false = company

  const WeightConfirmationScreen({
    super.key,
    required this.transaction,
    required this.isGenerator,
  });

  @override
  ConsumerState<WeightConfirmationScreen> createState() =>
      _WeightConfirmationScreenState();
}

class _WeightConfirmationScreenState
    extends ConsumerState<WeightConfirmationScreen> {
  final _weightCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    super.dispose();
  }

  double? get _inputWeight => double.tryParse(_weightCtrl.text);

  bool _wouldBeConfirmed(double myWeight) {
    final other = widget.isGenerator
        ? widget.transaction.companyConfirmedWeight
        : widget.transaction.generatorConfirmedWeight;
    if (other == null) return false;
    final diff = (myWeight - other).abs();
    final avg = (myWeight + other) / 2;
    return diff / avg <= 0.15;
  }

  Future<void> _confirm() async {
    final w = _inputWeight;
    if (w == null || w <= 0) return;
    setState(() => _loading = true);

    try {
      final txRef = FirebaseFirestore.instance
          .collection(AppConfig.transactionsCollection)
          .doc(widget.transaction.id);

      final Map<String, dynamic> update = {};
      if (widget.isGenerator) {
        update['generatorConfirmedWeight'] = w;
      } else {
        update['companyConfirmedWeight'] = w;
      }

      // Determine if we can auto-confirm
      final other = widget.isGenerator
          ? widget.transaction.companyConfirmedWeight
          : widget.transaction.generatorConfirmedWeight;

      if (other != null) {
        final diff = (w - other).abs();
        final avg = (w + other) / 2;
        if (diff / avg <= 0.15) {
          update['status'] = 'confirmed';

          // Also increment communityStats in the same batch
          final batch = FirebaseFirestore.instance.batch();
          batch.update(txRef, update);

          final statsRef = FirebaseFirestore.instance
              .collection(AppConfig.communityStatsCollection)
              .doc('global');
          batch.update(statsRef, {
            'totalKgRecycled': FieldValue.increment(widget.transaction.finalWeightKg),
            'totalTransactions': FieldValue.increment(1),
            'byCategory.${_getCategoryFromTx()}': FieldValue.increment(widget.transaction.finalWeightKg),
            'lastConfirmedTransactionId': widget.transaction.id,
            'updatedAt': FieldValue.serverTimestamp(),
          });
          await batch.commit();
        } else {
          // Weight mismatch — mark as disputed
          update['status'] = 'disputed';
          await txRef.update(update);

          // Fraud check: Extreme weight deviation
          await FraudDetectionService.checkWeightDeviation(
            transactionId: widget.transaction.id,
            agreedWeight: widget.transaction.finalWeightKg,
            actualWeight: w,
            submitterId: widget.isGenerator ? widget.transaction.generatorId : widget.transaction.companyId,
          );
        }
      } else {
        // Other party hasn't confirmed yet
        await txRef.update(update);
      }

      if (mounted) {
        final msg = update['status'] == 'confirmed'
            ? '✅ Transaction confirmed! Weight accepted.'
            : update['status'] == 'disputed'
                ? '⚠️ Weight mismatch — transaction disputed.'
                : 'Weight submitted — waiting for the other party.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg)),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String _getCategoryFromTx() {
    // We'd need to look up the offer category — using a placeholder for now.
    // In production this would be denormalized into the transaction document.
    return 'other';
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tx = widget.transaction;
    final role = widget.isGenerator ? 'Generator' : 'Company';
    final w = _inputWeight;
    final wouldConfirm = w != null && _wouldBeConfirmed(w);

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text('Confirm Weight ($role)'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Transaction summary card
          Card(
            color: cs.surfaceContainerHighest,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Transaction Summary', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                _Row('Agreed Weight', '${tx.finalWeightKg} kg'),
                _Row('Agreed Price', '${tx.agreedPrice.amount.toStringAsFixed(0)} ${tx.agreedPrice.currency}'),
                _Row('Status', tx.status.toUpperCase()),
                if (tx.generatorConfirmedWeight != null)
                  _Row('Generator confirmed', '${tx.generatorConfirmedWeight} kg'),
                if (tx.companyConfirmedWeight != null)
                  _Row('Company confirmed', '${tx.companyConfirmedWeight} kg'),
              ]),
            ),
          ),
          const SizedBox(height: 28),
          Text('Your Measured Weight', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _weightCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              labelText: 'Enter actual weight (kg)',
              hintText: 'e.g. 14.8',
              prefixIcon: Icon(Icons.scale_outlined, color: cs.primary),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: cs.surfaceContainerHighest,
              suffixIcon: w != null
                  ? Icon(
                      wouldConfirm ? Icons.check_circle_rounded : Icons.warning_amber_rounded,
                      color: wouldConfirm ? Colors.green : Colors.orange,
                    )
                  : null,
            ),
          ),
          if (w != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: wouldConfirm
                    ? Colors.green.withValues(alpha: 0.12)
                    : Colors.orange.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Icon(
                  wouldConfirm ? Icons.check_circle_outline : Icons.info_outline,
                  color: wouldConfirm ? Colors.green : Colors.orange,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    wouldConfirm
                        ? 'Within 15% tolerance — transaction will be confirmed.'
                        : 'Outside 15% tolerance — transaction will be disputed.',
                    style: TextStyle(
                      color: wouldConfirm ? Colors.green : Colors.orange,
                      fontSize: 13,
                    ),
                  ),
                ),
              ]),
            ),
          ],
          const Spacer(),
          FilledButton.icon(
            onPressed: (_loading || _inputWeight == null) ? null : _confirm,
            icon: _loading
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.check_rounded),
            label: Text(_loading ? 'Submitting…' : 'Submit Weight'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [
        Expanded(child: Text(label, style: TextStyle(color: cs.onSurfaceVariant))),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
