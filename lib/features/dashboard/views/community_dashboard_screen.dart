import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../models/stats_model.dart';

// ─── Community Stats Provider ─────────────────────────────────────────────────

final communityStatsProvider = StreamProvider<CommunityStatsModel?>((ref) {
  return FirebaseFirestore.instance
      .collection(AppConfig.communityStatsCollection)
      .doc('global')
      .snapshots()
      .map((snap) {
    if (!snap.exists || snap.data() == null) return null;
    return CommunityStatsModel.fromJson({...snap.data()!, 'id': snap.id});
  });
});

// ─── Community Dashboard Screen ───────────────────────────────────────────────

class CommunityDashboardScreen extends ConsumerWidget {
  const CommunityDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cs = Theme.of(context).colorScheme;
    final statsAsync = ref.watch(communityStatsProvider);

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: cs.primaryContainer,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Community Impact',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1B5E20),
                      const Color(0xFF2E7D32),
                      cs.primary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -30,
                      bottom: -30,
                      child: Icon(Icons.public_rounded,
                          size: 180, color: Colors.white.withOpacity(0.08)),
                    ),
                    const Center(
                      child: Icon(Icons.eco_rounded, size: 64, color: Colors.white54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          statsAsync.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => SliverFillRemaining(child: Center(child: Text('Error: $e'))),
            data: (stats) => SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Hero numbers
                  Row(children: [
                    Expanded(child: _HeroCard(
                      icon: Icons.scale_rounded,
                      value: stats == null ? '0' : _formatKg(stats.totalKgRecycled),
                      label: 'kg Recycled',
                      color: const Color(0xFF2E7D32),
                    )),
                    const SizedBox(width: 12),
                    Expanded(child: _HeroCard(
                      icon: Icons.handshake_rounded,
                      value: stats == null ? '0' : '${stats.totalTransactions}',
                      label: 'Transactions',
                      color: const Color(0xFF1565C0),
                    )),
                  ]),
                  const SizedBox(height: 12),
                  // CO₂ offset estimate card
                  _Co2Card(kgRecycled: stats?.totalKgRecycled ?? 0.0),
                  const SizedBox(height: 24),
                  // By category breakdown
                  Text('By Material Type',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  if (stats == null || stats.byCategory.isEmpty)
                    const _EmptyCategoryState()
                  else
                    ...stats.byCategory.entries.map((e) =>
                        _CategoryBar(category: e.key, kg: e.value, total: stats.totalKgRecycled)),
                  const SizedBox(height: 32),
                  // Call to action
                  _CallToAction(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatKg(double kg) {
    if (kg >= 1000) return '${(kg / 1000).toStringAsFixed(1)}t';
    return kg.toStringAsFixed(0);
  }
}

// ─── Hero Stats Card ──────────────────────────────────────────────────────────

class _HeroCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _HeroCard({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6)),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: Colors.white70, size: 28),
        const SizedBox(height: 12),
        Text(value,
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ]),
    );
  }
}

// ─── CO₂ Offset Card ─────────────────────────────────────────────────────────

class _Co2Card extends StatelessWidget {
  final double kgRecycled;

  const _Co2Card({required this.kgRecycled});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    // Rough estimate: 1 kg of mixed recycling ≈ 0.6 kg CO₂ offset
    final co2 = kgRecycled * 0.6;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.tertiaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cs.tertiary.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.air_rounded, color: cs.tertiary, size: 32),
        ),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Estimated CO₂ Offset',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: cs.onTertiaryContainer)),
          Text('${co2.toStringAsFixed(0)} kg',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: cs.onTertiaryContainer, fontWeight: FontWeight.bold)),
          Text('Based on 0.6 kg CO₂ / kg recycled',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: cs.onTertiaryContainer.withOpacity(0.6))),
        ])),
      ]),
    );
  }
}

// ─── Category Progress Bar ────────────────────────────────────────────────────

class _CategoryBar extends StatelessWidget {
  final String category;
  final double kg;
  final double total;

  const _CategoryBar({required this.category, required this.kg, required this.total});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final pct = total > 0 ? kg / total : 0.0;
    final label = AppConfig.wasteCategoryLabels[category] ?? category;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500))),
          Text('${kg.toStringAsFixed(0)} kg',
              style: TextStyle(color: cs.onSurfaceVariant, fontSize: 12)),
          const SizedBox(width: 6),
          Text('${(pct * 100).toStringAsFixed(0)}%',
              style: TextStyle(color: cs.primary, fontSize: 12, fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 6),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: pct),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          builder: (ctx, value, _) => ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: cs.surfaceContainerHighest,
              color: cs.primary,
            ),
          ),
        ),
      ]),
    );
  }
}

class _EmptyCategoryState extends StatelessWidget {
  const _EmptyCategoryState();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.bar_chart_rounded, size: 48, color: Colors.grey),
        SizedBox(height: 12),
        Text('No transactions recorded yet'),
        Text('Stats will appear after first confirmed pickup.', style: TextStyle(color: Colors.grey)),
      ]),
    );
  }
}

class _CallToAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.volunteer_activism_rounded, color: cs.primary),
          const SizedBox(width: 8),
          Text('Make an Impact', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 8),
        Text(
          'Every kilogram recycled through RecycleLink reduces landfill waste '
          'and supports local recycling businesses in Lebanon.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ]),
    );
  }
}
