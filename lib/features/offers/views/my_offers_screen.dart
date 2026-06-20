import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../models/match_model.dart';
import '../../../models/waste_offer_model.dart';
import '../../auth/providers/auth_providers.dart';
import '../../matching/providers/matching_provider.dart';
import '../providers/offers_providers.dart';


// ─── My Offers list screen (generator) ───────────────────────────────────────

class MyOffersScreen extends ConsumerWidget {
  const MyOffersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider).value;
    if (user == null) return const SizedBox();

    final offersAsync = ref.watch(generatorOffersProvider(user.uid));
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('My Offers'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: offersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (offers) {
          if (offers.isEmpty) {
            return _EmptyOffers();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: offers.length,
            itemBuilder: (ctx, i) => _OfferCard(offer: offers[i]),
          );
        },
      ),
    );
  }
}

class _EmptyOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.inbox_rounded, size: 80, color: Colors.grey.shade400),
        const SizedBox(height: 16),
        Text('No offers yet', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text('Tap "+" to post your first waste offer',
            style: TextStyle(color: Colors.grey.shade500)),
      ]),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final WasteOfferModel offer;
  const _OfferCard({required this.offer});

  static const _statusColors = {
    'open': Colors.green,
    'matched': Colors.blue,
    'scheduled': Colors.orange,
    'completed': Colors.teal,
    'disputed': Colors.red,
    'cancelled': Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final color = _statusColors[offer.status] ?? Colors.grey;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => OfferDetailScreen(offer: offer)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.recycling, color: cs.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    AppConfig.wasteCategoryLabels[offer.category] ?? offer.category,
                    style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('${offer.estimatedQuantityKg} kg',
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  offer.status.toUpperCase(),
                  style: TextStyle(
                      color: color, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: cs.onSurfaceVariant),
              const SizedBox(width: 4),
              Text(
                _formatDate(offer.createdAt),
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
              const Spacer(),
              if (offer.canTransportSelf)
                Row(children: [
                  Icon(Icons.drive_eta_outlined, size: 14, color: cs.primary),
                  const SizedBox(width: 4),
                  Text('Self-delivery', style: tt.bodySmall?.copyWith(color: cs.primary)),
                ]),
            ]),
          ]),
        ),
      ),
    );
  }

  String _formatDate(DateTime dt) =>
      '${dt.day}/${dt.month}/${dt.year}';
}

// ─── Offer Detail Screen ──────────────────────────────────────────────────────

class OfferDetailScreen extends ConsumerWidget {
  final WasteOfferModel offer;
  const OfferDetailScreen({super.key, required this.offer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final matchesAsync = ref.watch(offerMatchesProvider(offer.id));

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('Offer Details'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header
          Card(
            color: cs.surfaceContainerHighest,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(AppConfig.wasteCategoryLabels[offer.category] ?? offer.category,
                    style: tt.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(children: [
                  _Tag(icon: Icons.scale_outlined, label: '${offer.estimatedQuantityKg} kg'),
                  const SizedBox(width: 8),
                  _Tag(
                    icon: offer.canTransportSelf ? Icons.drive_eta_outlined : Icons.local_shipping_outlined,
                    label: offer.canTransportSelf ? 'Self-delivery' : 'Needs pickup',
                  ),
                ]),
                const SizedBox(height: 8),
                _Tag(icon: Icons.access_time_outlined, label: 'Posted ${_formatDate(offer.createdAt)}'),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          Text('Matched Companies', style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          matchesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error loading matches: $e'),
            data: (matches) {
              if (matches.isEmpty) {
                return Card(
                  color: cs.surfaceContainerLow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Icon(Icons.hourglass_top_rounded, size: 40),
                      SizedBox(height: 8),
                      Text('No matches yet. Running matching algorithm…'),
                    ]),
                  ),
                );
              }
              return Column(
                children: matches.map((m) => _MatchCard(match: m)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) => '${dt.day}/${dt.month}/${dt.year}';
}

// ─── Match Card ───────────────────────────────────────────────────────────────

class _MatchCard extends ConsumerWidget {
  final MatchModel match;
  const _MatchCard({required this.match});

  static const _statusColors = {
    'proposed': Colors.blue,
    'accepted': Colors.green,
    'declined': Colors.red,
    'expired': Colors.grey,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final color = _statusColors[match.status] ?? Colors.grey;
    final pct = (match.matchScore * 100).toStringAsFixed(0);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: cs.primaryContainer,
              child: Text(pct, style: TextStyle(color: cs.primary, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Company ID: ${match.companyId.substring(0, 8)}…',
                    style: tt.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                Text('Match score: $pct%', style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
              ]),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(match.status.toUpperCase(),
                  style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ]),
          const SizedBox(height: 12),
          // Score breakdown bars
          ...match.scoreBreakdown.entries.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                SizedBox(
                  width: 72,
                  child: Text(e.key, style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant)),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: e.value.clamp(0.0, 1.0),
                      backgroundColor: cs.surfaceContainerHighest,
                      color: cs.primary,
                      minHeight: 6,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text('${(e.value * 100).toStringAsFixed(0)}%',
                    style: tt.labelSmall?.copyWith(fontWeight: FontWeight.bold)),
              ]),
            ]),
          )),
          if (match.status == 'proposed') ...[
            const SizedBox(height: 8),
            Text('Waiting for company response…',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant, fontStyle: FontStyle.italic)),
          ],
          if (match.status == 'accepted') ...[
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => CreateTransactionScreen(match: match),
                ),
              ),
              icon: const Icon(Icons.handshake_outlined),
              label: const Text('Confirm Pickup'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ]),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Tag({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 14, color: cs.primary),
      const SizedBox(width: 4),
      Text(label, style: TextStyle(fontSize: 13, color: cs.onSurfaceVariant)),
    ]);
  }
}

// ─── Placeholder to avoid circular import ─────────────────────────────────────
// The full CreateTransactionScreen is in transactions/views/
class CreateTransactionScreen extends StatelessWidget {
  final MatchModel match;
  const CreateTransactionScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    // Delegate to the actual screen
    return _TransactionConfirmationScreen(match: match);
  }
}

class _TransactionConfirmationScreen extends ConsumerStatefulWidget {
  final MatchModel match;
  const _TransactionConfirmationScreen({required this.match});

  @override
  ConsumerState<_TransactionConfirmationScreen> createState() => _TxScreenState();
}

class _TxScreenState extends ConsumerState<_TransactionConfirmationScreen> {
  final _weightCtrl = TextEditingController();
  final _priceCtrl = TextEditingController();
  String _currency = 'LBP';
  bool _loading = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    final weight = double.tryParse(_weightCtrl.text);
    final price = double.tryParse(_priceCtrl.text);
    if (weight == null || price == null) return;
    setState(() => _loading = true);
    try {
      if (ref.read(authStateProvider).value == null) {
        throw Exception('Not authenticated');
      }
      final txRef = FirebaseFirestore.instance
          .collection(AppConfig.transactionsCollection)
          .doc();
      await txRef.set({
        'id': txRef.id,
        'matchId': widget.match.id,
        'generatorId': widget.match.generatorId,
        'companyId': widget.match.companyId,
        'finalWeightKg': weight,
        'agreedPrice': {'amount': price, 'currency': _currency},
        'status': 'pendingConfirmation',
        'recordedAt': FieldValue.serverTimestamp(),
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaction created — both parties must confirm weight')),
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

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Transaction'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextFormField(
            controller: _weightCtrl,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Agreed Weight (kg)',
              prefixIcon: Icon(Icons.scale_outlined, color: cs.primary),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: cs.surfaceContainerHighest,
            ),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: TextFormField(
                controller: _priceCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Agreed Price',
                  prefixIcon: Icon(Icons.attach_money, color: cs.primary),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: cs.surfaceContainerHighest,
                ),
              ),
            ),
            const SizedBox(width: 12),
            DropdownButton<String>(
              value: _currency,
              items: const [
                DropdownMenuItem(value: 'LBP', child: Text('LBP')),
                DropdownMenuItem(value: 'USD', child: Text('USD')),
              ],
              onChanged: (v) => setState(() => _currency = v!),
            ),
          ]),
          const Spacer(),
          FilledButton.icon(
            onPressed: _loading ? null : _create,
            icon: const Icon(Icons.check_circle_outline),
            label: Text(_loading ? 'Creating…' : 'Confirm & Create Transaction'),
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


