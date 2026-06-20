import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/config/app_config.dart';
import '../../../core/services/cloudinary_service.dart';
import '../../../core/services/fraud_detection_service.dart';
import '../../../core/utils/geo_utils.dart';
import '../../../models/user_model.dart';
import '../../../models/waste_offer_model.dart';
import '../../auth/providers/auth_providers.dart';
import '../../matching/providers/matching_provider.dart';

// ─── Create Offer Screen ────────────────────────────────────────────────────

class CreateOfferScreen extends ConsumerStatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  ConsumerState<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends ConsumerState<CreateOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  String _selectedCategory = AppConfig.wasteCategories.first;
  final _kgController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _pickupStart;
  DateTime? _pickupEnd;
  bool _canTransport = false;
  final List<File> _photos = [];
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _kgController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    if (_photos.length >= 3) {
      setState(() => _error = 'Maximum 3 photos allowed.');
      return;
    }
    final xFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxWidth: 1200,
    );
    if (xFile != null) {
      setState(() => _photos.add(File(xFile.path)));
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_pickupStart == null || _pickupEnd == null) {
      setState(() => _error = 'Please set a preferred pickup window.');
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final user = ref.read(authStateProvider).value;
      if (user == null) throw Exception('Not signed in');

      // Upload photos to Cloudinary
      final photoUrls = <String>[];
      for (final file in _photos) {
        final url = await CloudinaryService.uploadImage(await file.readAsBytes(),
            fileName: '${user.uid}_${DateTime.now().millisecondsSinceEpoch}');
        if (url != null) photoUrls.add(url);
      }

      // Build the offer document
      final firestore = FirebaseFirestore.instance;
      final userDoc = await firestore
          .collection(AppConfig.usersCollection)
          .doc(user.uid)
          .get();
      final loc = userDoc.data()!['location'] as Map<String, dynamic>;
      final gp = loc['geopoint'] as GeoPoint;
      final geohash = GeoUtils.encodeGeohash(gp.latitude, gp.longitude);

      final offerRef =
          firestore.collection(AppConfig.wasteOffersCollection).doc();
      final offer = WasteOfferModel(
        id: offerRef.id,
        generatorId: user.uid,
        generatorLocation: GeoLocation(
          geopoint: gp,
          geohash: geohash,
        ),
        category: _selectedCategory,
        estimatedQuantityKg: double.parse(_kgController.text),
        photos: photoUrls,
        canTransportSelf: _canTransport,
        status: 'open',
        createdAt: DateTime.now(),
        preferredPickupWindow: PickupWindow(
          start: _pickupStart!,
          end: _pickupEnd!,
        ),
      );

      await offerRef.set(offer.toJson());

      // Fraud check: Suspiciously high quantity
      await FraudDetectionService.checkOfferQuantity(
        offerId: offer.id,
        weightKg: offer.estimatedQuantityKg,
        generatorId: user.uid,
      );

      // Run matching algorithm — writes match docs to /matches
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Offer posted! Finding matches…')),
        );
      }

      await runMatchingForOffer(
        offer: offer,
        generatorId: user.uid,
        firestore: firestore,
      );

      if (mounted) {
        Navigator.of(context).pop(true); // Return true = created successfully
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _pickWindow(bool isStart) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      if (isStart) {
        _pickupStart = dt;
      } else {
        _pickupEnd = dt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: const Text('Post Waste Offer'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: cs.onSurface,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ── Category ──
            Text('Waste Category', style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant)),
            const SizedBox(height: 8),
            _CategoryGrid(
              selected: _selectedCategory,
              onSelect: (c) => setState(() => _selectedCategory = c),
            ),
            const SizedBox(height: 24),

            // ── Estimated Kg ──
            TextFormField(
              controller: _kgController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Estimated Weight (kg)',
                hintText: 'e.g. 15.5',
                prefixIcon: Icon(Icons.scale_outlined, color: cs.primary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: cs.surfaceContainerHighest,
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (double.tryParse(v) == null) return 'Enter a valid number';
                if (double.parse(v) <= 0) return 'Must be > 0';
                return null;
              },
            ),
            const SizedBox(height: 16),

            // ── Transport toggle ──
            Container(
              decoration: BoxDecoration(
                color: cs.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: SwitchListTile(
                title: const Text('I can deliver it myself'),
                subtitle: Text(
                  'Toggle off if you need the company to collect',
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
                value: _canTransport,
                onChanged: (v) => setState(() => _canTransport = v),
                activeColor: cs.primary,
              ),
            ),
            const SizedBox(height: 24),

            // ── Pickup Window ──
            Text('Preferred Pickup Window', style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant)),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: _DateButton(
                  label: 'From',
                  date: _pickupStart,
                  onTap: () => _pickWindow(true),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _DateButton(
                  label: 'Until',
                  date: _pickupEnd,
                  onTap: () => _pickWindow(false),
                ),
              ),
            ]),
            const SizedBox(height: 24),

            // ── Photos ──
            Text('Photos (optional, max 3)', style: tt.labelLarge?.copyWith(color: cs.onSurfaceVariant)),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ..._photos.map((f) => _PhotoThumb(file: f, onRemove: () => setState(() => _photos.remove(f)))),
                  if (_photos.length < 3)
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 90,
                        height: 90,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: cs.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: cs.outlineVariant),
                        ),
                        child: Icon(Icons.add_photo_alternate_outlined, color: cs.primary, size: 32),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            if (_error != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_error!, style: TextStyle(color: cs.onErrorContainer)),
              ),
            const SizedBox(height: 16),

            // ── Submit ──
            FilledButton.icon(
              onPressed: _loading ? null : _submit,
              icon: _loading
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Icon(Icons.send_rounded),
              label: Text(_loading ? 'Posting…' : 'Post Offer & Find Matches'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Category grid widget ─────────────────────────────────────────────────────

class _CategoryGrid extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;

  const _CategoryGrid({required this.selected, required this.onSelect});

  static const _icons = <String, IconData>{
    'plastic_pet': Icons.water_drop_outlined,
    'plastic_other': Icons.recycling,
    'aluminum_cans': Icons.wine_bar_outlined,
    'glass': Icons.local_bar_outlined,
    'paper_cardboard': Icons.article_outlined,
    'organic_compostable': Icons.eco_outlined,
    'e_waste': Icons.devices_outlined,
    'metal_scrap': Icons.hardware_outlined,
    'textile': Icons.checkroom_outlined,
    'other': Icons.category_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AppConfig.wasteCategories.map((cat) {
        final isSelected = cat == selected;
        return FilterChip(
          label: Text(AppConfig.wasteCategoryLabels[cat] ?? cat),
          avatar: Icon(_icons[cat] ?? Icons.category_outlined,
              size: 16, color: isSelected ? cs.onPrimary : cs.primary),
          selected: isSelected,
          onSelected: (_) => onSelect(cat),
          backgroundColor: cs.surfaceContainerHighest,
          selectedColor: cs.primary,
          labelStyle: TextStyle(
            color: isSelected ? cs.onPrimary : cs.onSurface,
            fontSize: 12,
          ),
          checkmarkColor: cs.onPrimary,
        );
      }).toList(),
    );
  }
}

class _DateButton extends StatelessWidget {
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  const _DateButton({required this.label, required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(Icons.calendar_today_outlined, size: 16, color: cs.primary),
      label: Text(
        date == null
            ? label
            : '${date!.day}/${date!.month} ${date!.hour}:${date!.minute.toString().padLeft(2, '0')}',
        style: TextStyle(color: date == null ? cs.onSurfaceVariant : cs.primary, fontSize: 13),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class _PhotoThumb extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const _PhotoThumb({required this.file, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90,
          height: 90,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: FileImage(file), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 4,
          right: 12,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
