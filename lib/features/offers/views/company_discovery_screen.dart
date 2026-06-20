import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../models/company_profile_model.dart';
import '../../../models/waste_offer_model.dart';

// ─── Company search filters state ────────────────────────────────────────────

class CompanySearchFilters {
  final String? category;
  final double maxDistanceKm;
  final bool requiresDriver;
  final String sortBy; // 'distance' | 'rating' | 'price'

  const CompanySearchFilters({
    this.category,
    this.maxDistanceKm = 30.0,
    this.requiresDriver = false,
    this.sortBy = 'distance',
  });

  CompanySearchFilters copyWith({
    String? category,
    double? maxDistanceKm,
    bool? requiresDriver,
    String? sortBy,
  }) => CompanySearchFilters(
        category: category ?? this.category,
        maxDistanceKm: maxDistanceKm ?? this.maxDistanceKm,
        requiresDriver: requiresDriver ?? this.requiresDriver,
        sortBy: sortBy ?? this.sortBy,
      );
}

// ─── Company list provider ────────────────────────────────────────────────────

final companySearchProvider =
    StreamProvider.family<List<CompanyProfileModel>, CompanySearchFilters>((ref, filters) {
  var query = FirebaseFirestore.instance
      .collection(AppConfig.companyProfilesCollection)
      .where('isApproved', isEqualTo: true);

  if (filters.category != null) {
    query = query.where('acceptedCategories', arrayContains: filters.category);
  }
  if (filters.requiresDriver) {
    query = query.where('hasDrivers', isEqualTo: true);
  }

  return query.snapshots().map((snap) {
    var list = snap.docs
        .map((d) => CompanyProfileModel.fromJson({...d.data(), 'id': d.id}))
        .toList();

    // Client-side sort (distance sorting requires caller's location, done in widget)
    if (filters.sortBy == 'rating') {
      list.sort((a, b) => b.rating.compareTo(a.rating));
    }
    return list;
  });
});

// ─── Company Discovery Screen ────────────────────────────────────────────────

class CompanyDiscoveryScreen extends ConsumerStatefulWidget {
  /// If [offer] is provided, the screen shows a contextual "Request Match" button.
  final WasteOfferModel? offer;

  const CompanyDiscoveryScreen({super.key, this.offer});

  @override
  ConsumerState<CompanyDiscoveryScreen> createState() =>
      _CompanyDiscoveryScreenState();
}

class _CompanyDiscoveryScreenState
    extends ConsumerState<CompanyDiscoveryScreen> {
  CompanySearchFilters _filters = const CompanySearchFilters();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final companiesAsync = ref.watch(companySearchProvider(_filters));

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('Recycling Companies'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () => _showFilters(context),
            tooltip: 'Filter',
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Search bar ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: SearchBar(
              hintText: 'Search companies…',
              leading: const Icon(Icons.search),
              onChanged: (v) => setState(() => _searchQuery = v.toLowerCase()),
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(cs.surfaceContainerHighest),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              )),
            ),
          ),
          // ── Category chips ──
          _CategoryFilterRow(
            selected: _filters.category,
            onSelect: (c) => setState(() =>
                _filters = _filters.copyWith(category: c == _filters.category ? null : c)),
          ),
          // ── Results ──
          Expanded(
            child: companiesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (companies) {
                final filtered = _searchQuery.isEmpty
                    ? companies
                    : companies.where((c) =>
                        c.companyName.toLowerCase().contains(_searchQuery) ||
                        c.description.toLowerCase().contains(_searchQuery)).toList();

                if (filtered.isEmpty) {
                  return _EmptyState(hasFilters: _filters.category != null || _filters.requiresDriver);
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filtered.length,
                  itemBuilder: (ctx, i) => _CompanyCard(
                    company: filtered[i],
                    offer: widget.offer,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFilters(BuildContext context) async {
    final result = await showModalBottomSheet<CompanySearchFilters>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FiltersSheet(current: _filters),
    );
    if (result != null) setState(() => _filters = result);
  }
}

// ─── Category Filter Row ──────────────────────────────────────────────────────

class _CategoryFilterRow extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onSelect;

  const _CategoryFilterRow({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: AppConfig.wasteCategories.map((cat) {
          final sel = cat == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(AppConfig.wasteCategoryLabels[cat] ?? cat,
                  style: TextStyle(fontSize: 12, color: sel ? cs.onPrimary : cs.onSurface)),
              selected: sel,
              onSelected: (_) => onSelect(cat),
              backgroundColor: cs.surfaceContainerHighest,
              selectedColor: cs.primary,
              checkmarkColor: cs.onPrimary,
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─── Company Card ─────────────────────────────────────────────────────────────

class _CompanyCard extends StatelessWidget {
  final CompanyProfileModel company;
  final WasteOfferModel? offer;

  const _CompanyCard({required this.company, this.offer});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => CompanyDetailScreen(company: company)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              // Avatar
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cs.primary.withValues(alpha: 0.8), cs.secondary.withValues(alpha: 0.8)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    company.companyName.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(company.companyName,
                      style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text(company.description,
                      style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Row(children: [
                  Icon(Icons.star_rounded, size: 16, color: Colors.amber.shade600),
                  const SizedBox(width: 2),
                  Text(company.rating.toStringAsFixed(1),
                      style: tt.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                ]),
                Text('(${company.ratingCount})', style: tt.labelSmall?.copyWith(color: cs.onSurfaceVariant)),
              ]),
            ]),
            const SizedBox(height: 12),
            // Accepted categories chips
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: company.acceptedCategories.take(4).map((cat) => Chip(
                label: Text(AppConfig.wasteCategoryLabels[cat] ?? cat,
                    style: const TextStyle(fontSize: 10)),
                backgroundColor: cs.primaryContainer,
                labelStyle: TextStyle(color: cs.onPrimaryContainer),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              )).toList(),
            ),
            const SizedBox(height: 10),
            Row(children: [
              _InfoPill(icon: Icons.scale_outlined,
                  label: 'Min ${company.minWeightKg.toStringAsFixed(0)} kg'),
              const SizedBox(width: 8),
              if (company.hasDrivers)
                _InfoPill(icon: Icons.local_shipping_outlined, label: 'Has drivers'),
              const SizedBox(width: 8),
              _InfoPill(icon: Icons.radio_button_checked_outlined,
                  label: '≤${company.serviceRadiusKm.toStringAsFixed(0)} km'),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: cs.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 13, color: cs.onSecondaryContainer),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 11, color: cs.onSecondaryContainer)),
      ]),
    );
  }
}

// ─── Company Detail Screen ────────────────────────────────────────────────────

class CompanyDetailScreen extends StatelessWidget {
  final CompanyProfileModel company;

  const CompanyDetailScreen({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: cs.primaryContainer,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(company.companyName,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [cs.primary, cs.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(child: Icon(Icons.business_rounded, size: 64, color: Colors.white38)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Rating
                Row(children: [
                  ...List.generate(5, (i) => Icon(
                    i < company.rating.round() ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: Colors.amber.shade600,
                    size: 20,
                  )),
                  const SizedBox(width: 8),
                  Text('${company.rating.toStringAsFixed(1)} (${company.ratingCount} reviews)',
                      style: tt.bodyMedium),
                ]),
                const SizedBox(height: 16),
                Text('About', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(company.description, style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant)),
                const SizedBox(height: 20),

                Text('Accepted Materials', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: company.acceptedCategories.map((cat) => Chip(
                    label: Text(AppConfig.wasteCategoryLabels[cat] ?? cat),
                    avatar: const Icon(Icons.recycling, size: 16),
                    backgroundColor: cs.primaryContainer,
                    labelStyle: TextStyle(color: cs.onPrimaryContainer),
                  )).toList(),
                ),
                const SizedBox(height: 20),

                Text('Pricing', style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...company.pricePerUnit.entries.map((e) {
                  final data = e.value as Map<String, dynamic>;
                  final amount = (data['amount'] as num?)?.toDouble() ?? 0.0;
                  final currency = data['currency'] as String? ?? 'LBP';
                  final unit = data['unit'] as String? ?? 'kg';
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.attach_money_rounded, color: cs.primary),
                    title: Text(AppConfig.wasteCategoryLabels[e.key] ?? e.key),
                    trailing: Text(
                      '${CurrencyUtils.format(amount, currency)} / $unit',
                      style: tt.labelLarge?.copyWith(
                          color: cs.primary, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
                const SizedBox(height: 20),

                Card(
                  color: cs.surfaceContainerHighest,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: [
                      _DetailRow(icon: Icons.scale_outlined,
                          label: 'Minimum Weight', value: '${company.minWeightKg} kg'),
                      _DetailRow(icon: Icons.radio_button_checked_outlined,
                          label: 'Service Radius', value: '${company.serviceRadiusKm} km'),
                      _DetailRow(icon: Icons.local_shipping_outlined,
                          label: 'Has Drivers', value: company.hasDrivers ? 'Yes' : 'No'),
                      if (company.hasDrivers)
                        _DetailRow(icon: Icons.inventory_2_outlined,
                            label: 'Daily Capacity', value: '${company.driverCapacityKgPerDay} kg/day'),
                    ]),
                  ),
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Icon(icon, size: 18, color: cs.primary),
        const SizedBox(width: 12),
        Expanded(child: Text(label)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}

// ─── Filters Bottom Sheet ─────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final bool hasFilters;
  const _EmptyState({required this.hasFilters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(Icons.search_off_rounded, size: 72, color: Colors.grey.shade500),
        const SizedBox(height: 16),
        Text(
          hasFilters ? 'No companies match your filters' : 'No companies found',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text('Try adjusting your filters or search radius',
            style: TextStyle(color: Colors.grey.shade500)),
      ]),
    );
  }
}

class _FiltersSheet extends StatefulWidget {
  final CompanySearchFilters current;
  const _FiltersSheet({required this.current});

  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  late CompanySearchFilters _f;

  @override
  void initState() {
    super.initState();
    _f = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(child: Container(
          width: 36, height: 4,
          decoration: BoxDecoration(color: cs.outlineVariant, borderRadius: BorderRadius.circular(2)),
        )),
        const SizedBox(height: 20),
        Text('Filter Companies', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Text('Max Radius: ${_f.maxDistanceKm.toStringAsFixed(0)} km'),
        Slider(
          value: _f.maxDistanceKm,
          min: 5,
          max: 50,
          divisions: 9,
          onChanged: (v) => setState(() => _f = _f.copyWith(maxDistanceKm: v)),
        ),
        SwitchListTile(
          title: const Text('Requires Driver (company picks up)'),
          value: _f.requiresDriver,
          onChanged: (v) => setState(() => _f = _f.copyWith(requiresDriver: v)),
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 8),
        Text('Sort By'),
        const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment(value: 'distance', label: Text('Distance'), icon: Icon(Icons.near_me_outlined)),
            ButtonSegment(value: 'rating', label: Text('Rating'), icon: Icon(Icons.star_outline)),
          ],
          selected: {_f.sortBy},
          onSelectionChanged: (s) => setState(() => _f = _f.copyWith(sortBy: s.first)),
        ),
        const SizedBox(height: 20),
        Row(children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context, const CompanySearchFilters()),
              child: const Text('Reset'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              onPressed: () => Navigator.pop(context, _f),
              child: const Text('Apply'),
            ),
          ),
        ]),
      ]),
    );
  }
}
