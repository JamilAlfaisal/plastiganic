import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../models/match_model.dart';
import '../../../models/waste_offer_model.dart';

// Provider to fetch accepted matches that require company pickup
final pendingPickupsProvider = StreamProvider.family<List<MatchModel>, String>((ref, companyId) {
  return FirebaseFirestore.instance
      .collection(AppConfig.matchesCollection)
      .where('companyId', isEqualTo: companyId)
      .where('status', isEqualTo: 'accepted')
      .where('transportDecision', whereIn: ['companyPickup', 'batchedPickup'])
      .snapshots()
      .map((s) => s.docs.map((d) => MatchModel.fromJson({...d.data(), 'id': d.id})).toList());
});

class PickupCoordinationScreen extends ConsumerWidget {
  final String companyId;
  const PickupCoordinationScreen({super.key, required this.companyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final pickupsAsync = ref.watch(pendingPickupsProvider(companyId));

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('Pickup Coordination'),
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: pickupsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (matches) {
          if (matches.isEmpty) {
            return Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.local_shipping_outlined, size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text('No pending pickups', style: Theme.of(context).textTheme.headlineSmall),
              ]),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: matches.length,
            itemBuilder: (ctx, i) => _PickupCard(match: matches[i]),
          );
        },
      ),
    );
  }
}

class _PickupCard extends ConsumerWidget {
  final MatchModel match;
  const _PickupCard({required this.match});

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
                color: cs.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.location_on, color: cs.secondary),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Offer ID: ${match.offerId.substring(0, 6)}...', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text('Type: ${match.transportDecision}',
                    style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant)),
              ]),
            ),
            IconButton(
              icon: Icon(Icons.check_circle_outline, color: cs.primary),
              onPressed: () => _markPickedUp(context),
              tooltip: 'Mark as Picked Up',
            ),
          ]),
        ]),
      ),
    );
  }

  Future<void> _markPickedUp(BuildContext context) async {
    try {
      // Logic to convert Match to Transaction and start weight confirmation
      final txRef = FirebaseFirestore.instance.collection(AppConfig.transactionsCollection).doc();
      final batch = FirebaseFirestore.instance.batch();
      
      // We don't have all offer details here, so typically we'd fetch the offer first.
      // For this UI demo, we'll just update the match status.
      batch.update(
        FirebaseFirestore.instance.collection(AppConfig.matchesCollection).doc(match.id),
        {'status': 'completed'}
      );
      await batch.commit();

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pickup completed!'), backgroundColor: Colors.green),
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
