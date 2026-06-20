import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/waste_offer_model.dart';
import '../../auth/providers/auth_providers.dart';
import '../../auth/providers/user_repository.dart';
import '../../offers/providers/offers_providers.dart';
import '../../offers/views/create_offer_screen.dart';
import '../../offers/views/my_offers_screen.dart';
import '../../offers/views/company_discovery_screen.dart';
import '../views/community_dashboard_screen.dart';

class GeneratorDashboard extends ConsumerStatefulWidget {
  const GeneratorDashboard({super.key});

  @override
  ConsumerState<GeneratorDashboard> createState() => _GeneratorDashboardState();
}

class _GeneratorDashboardState extends ConsumerState<GeneratorDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    const tabs = [
      _GeneratorHomeTab(),
      MyOffersScreen(),
      CompanyDiscoveryScreen(),
      CommunityDashboardScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: tabs),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: colors.surface,
        indicatorColor: colors.primary.withValues(alpha: 0.15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.home, color: colors.primary),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.inventory_2, color: colors.primary),
            label: 'My Offers',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.search, color: colors.primary),
            label: 'Companies',
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.eco, color: colors.primary),
            label: 'Impact',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0 || _currentIndex == 1
          ? FloatingActionButton.extended(
              heroTag: 'gen_fab',
              onPressed: () async {
                final result = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute<bool>(builder: (_) => const CreateOfferScreen()),
                );
                if (result == true && mounted) {
                  setState(() => _currentIndex = 1);
                }
              },
              backgroundColor: colors.primary,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add),
              label: const Text('New Offer'),
            )
          : null,
    );
  }
}

// ─── Generator Home Tab ────────────────────────────────────────────────────────

class _GeneratorHomeTab extends ConsumerWidget {
  const _GeneratorHomeTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profileAsync = ref.watch(currentUserProfileProvider);
    final userAsync = ref.watch(authStateProvider);
    final uid = userAsync.value?.uid;
    final offersAsync = uid != null ? ref.watch(generatorOffersProvider(uid)) : null;

    final displayName = profileAsync.value?.displayName ?? 'Recycler';
    final allOffers = offersAsync?.value ?? [];
    final openCount = allOffers.where((o) => o.status == 'open').length;
    final matchedCount = allOffers.where((o) => o.status == 'matched' || o.status == 'scheduled').length;
    final doneCount = allOffers.where((o) => o.status == 'completed').length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // ── Header ──
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Welcome back 👋',
                  style: theme.textTheme.bodyLarge?.copyWith(color: colors.onSurfaceVariant)),
              const SizedBox(height: 4),
              Text(displayName,
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            ]),
            PopupMenuButton<String>(
              onSelected: (v) {
                if (v == 'signout') {
                  ref.read(authServiceProvider).signOut();
                }
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: colors.primary.withValues(alpha: 0.15),
                child: Icon(Icons.person, color: colors.primary),
              ),
              itemBuilder: (_) => const [
                PopupMenuItem(value: 'signout', child: Row(children: [
                  Icon(Icons.logout_rounded),
                  SizedBox(width: 8),
                  Text('Sign Out'),
                ])),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),

        // ── Stats Row ──
        Row(children: [
          _StatCard(icon: Icons.local_offer_outlined, label: 'Open', value: '$openCount',
              gradient: [colors.primary, const Color(0xFF059669)]),
          const SizedBox(width: 12),
          _StatCard(icon: Icons.handshake_outlined, label: 'Matched', value: '$matchedCount',
              gradient: [colors.secondary, const Color(0xFF6366F1)]),
          const SizedBox(width: 12),
          _StatCard(icon: Icons.check_circle_outline, label: 'Done', value: '$doneCount',
              gradient: [const Color(0xFF0891B2), const Color(0xFF0284C7)]),
        ]),
        const SizedBox(height: 28),

        // ── Quick actions ──
        Text('Quick Actions', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(children: [
          _QuickAction(
            icon: Icons.add_circle_outline_rounded,
            label: 'Post Offer',
            color: colors.primary,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const CreateOfferScreen()),
            ),
          ),
          const SizedBox(width: 12),
          _QuickAction(
            icon: Icons.search_rounded,
            label: 'Companies',
            color: colors.secondary,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const CompanyDiscoveryScreen()),
            ),
          ),
          const SizedBox(width: 12),
          _QuickAction(
            icon: Icons.eco_rounded,
            label: 'My Impact',
            color: const Color(0xFF16A34A),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const CommunityDashboardScreen()),
            ),
          ),
        ]),
        const SizedBox(height: 28),

        // ── Recent offers ──
        Text('Recent Offers', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        if (allOffers.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colors.outline.withValues(alpha: 0.15)),
            ),
            child: Column(children: [
              Icon(Icons.inbox_outlined, size: 48, color: colors.onSurface.withValues(alpha: 0.3)),
              const SizedBox(height: 12),
              Text('No offers yet', style: theme.textTheme.bodyLarge),
              const SizedBox(height: 4),
              Text('Tap "+ New Offer" to get started!',
                  style: theme.textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
            ]),
          )
        else
          ...allOffers.take(3).map((o) => _RecentOfferTile(offer: o)),
        const SizedBox(height: 32),
      ]),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<Color> gradient;

  const _StatCard({required this.icon, required this.label, required this.value, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: gradient[0].withValues(alpha: 0.25), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        ]),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 6),
            Text(label,
                style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ]),
        ),
      ),
    );
  }
}

class _RecentOfferTile extends StatelessWidget {
  final WasteOfferModel offer;
  const _RecentOfferTile({required this.offer});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final color = _statusColor(offer.status);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: cs.primaryContainer, borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.recycling, size: 18, color: cs.primary),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text('${offer.estimatedQuantityKg} kg · ${offer.category.replaceAll('_', ' ')}')),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(offer.status,
              style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'open': return Colors.green;
      case 'matched': return Colors.blue;
      case 'scheduled': return Colors.orange;
      case 'completed': return Colors.teal;
      default: return Colors.grey;
    }
  }
}
