import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/match_model.dart';
import '../../auth/providers/auth_providers.dart';
import '../../auth/providers/user_repository.dart';
import '../../matching/providers/matching_provider.dart';
import '../../transactions/views/transactions_screen.dart';
import '../../transport/views/pickup_coordination_screen.dart';
import '../views/community_dashboard_screen.dart';

class CompanyDashboard extends ConsumerStatefulWidget {
  const CompanyDashboard({super.key});

  @override
  ConsumerState<CompanyDashboard> createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends ConsumerState<CompanyDashboard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final user = ref.watch(authStateProvider).value;
    final companyId = user?.uid ?? '';

    final tabs = [
      _CompanyHomeTab(companyId: companyId),
      CompanyMatchInboxScreen(companyId: companyId),
      PickupCoordinationScreen(companyId: companyId),
      const CommunityDashboardScreen(),
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
            icon: Icon(Icons.dashboard_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.dashboard, color: colors.primary),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.compare_arrows_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.compare_arrows, color: colors.primary),
            label: 'Matches',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.local_shipping, color: colors.primary),
            label: 'Pickups',
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined, color: colors.onSurface.withValues(alpha: 0.5)),
            selectedIcon: Icon(Icons.eco, color: colors.primary),
            label: 'Impact',
          ),
        ],
      ),
    );
  }
}

// ─── Company Home Tab ─────────────────────────────────────────────────────────

class _CompanyHomeTab extends ConsumerWidget {
  final String companyId;
  const _CompanyHomeTab({required this.companyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final profileAsync = ref.watch(currentUserProfileProvider);
    final matchesAsync = ref.watch(companyPendingMatchesProvider(companyId));
    final txAsync = ref.watch(companyTransactionsProvider(companyId));

    final displayName = profileAsync.value?.displayName ?? 'Company';
    final pendingCount = matchesAsync.value?.length ?? 0;
    final allTx = txAsync.value ?? [];
    final completedCount = allTx.where((t) => t.status == 'confirmed').length;
    final totalKg = allTx
        .where((t) => t.status == 'confirmed')
        .fold<double>(0.0, (sum, t) => sum + t.finalWeightKg);

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
                backgroundColor: colors.secondary.withValues(alpha: 0.15),
                child: Icon(Icons.business, color: colors.secondary),
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

        // ── Stats Grid ──
        Row(children: [
          _CStatCard(icon: Icons.compare_arrows, label: 'Pending Matches',
              value: '$pendingCount',
              gradient: [colors.secondary, const Color(0xFF6366F1)]),
          const SizedBox(width: 12),
          _CStatCard(icon: Icons.check_circle_outline, label: 'Completed',
              value: '$completedCount',
              gradient: [colors.primary, const Color(0xFF059669)]),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          _CStatCard(icon: Icons.scale, label: 'Collected',
              value: '${totalKg.toStringAsFixed(0)} kg',
              gradient: [const Color(0xFFF59E0B), const Color(0xFFEF4444)]),
          const SizedBox(width: 12),
          _CStatCard(icon: Icons.local_shipping, label: 'Scheduled',
              value: '—',
              gradient: [const Color(0xFF8B5CF6), const Color(0xFFEC4899)]),
        ]),
        const SizedBox(height: 28),

        // ── Pending matches preview ──
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Pending Matches',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 12),

        if (pendingCount == 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: colors.outline.withValues(alpha: 0.15)),
            ),
            child: Column(children: [
              Icon(Icons.compare_arrows, size: 48, color: colors.onSurface.withValues(alpha: 0.3)),
              const SizedBox(height: 12),
              Text('No pending matches', style: theme.textTheme.bodyLarge),
              const SizedBox(height: 4),
              Text(
                'Matches appear when generators post offers in your service area.',
                style: theme.textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ]),
          )
        else
          ...matchesAsync.value!.take(3).map((m) => _MatchPreviewTile(match: m)),

        const SizedBox(height: 32),
      ]),
    );
  }
}

class _CStatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<Color> gradient;

  const _CStatCard({required this.icon, required this.label, required this.value, required this.gradient});

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

class _MatchPreviewTile extends StatelessWidget {
  final MatchModel match;
  const _MatchPreviewTile({required this.match});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
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
          decoration: BoxDecoration(color: cs.secondaryContainer, borderRadius: BorderRadius.circular(8)),
          child: Icon(Icons.handshake_outlined, size: 18, color: cs.secondary),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text('Score: ${(match.matchScore * 100).toStringAsFixed(0)}%')),
        Text(match.transportDecision,
            style: TextStyle(color: cs.primary, fontSize: 12)),
      ]),
    );
  }
}
