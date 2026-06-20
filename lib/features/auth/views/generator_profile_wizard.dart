import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/geo_utils.dart';
import '../../../models/generator_profile_model.dart';
import '../../../models/user_model.dart';
import '../providers/auth_providers.dart';
import '../providers/user_repository.dart';

class GeneratorProfileWizard extends ConsumerStatefulWidget {
  const GeneratorProfileWizard({super.key});

  @override
  ConsumerState<GeneratorProfileWizard> createState() =>
      _GeneratorProfileWizardState();
}

class _GeneratorProfileWizardState
    extends ConsumerState<GeneratorProfileWizard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _generatorType = 'household';
  bool _canTransportSelf = false;
  bool _isLoading = false;

  final List<Map<String, dynamic>> _generatorTypes = [
    {'value': 'household', 'label': 'Household', 'icon': Icons.home_outlined},
    {'value': 'restaurant', 'label': 'Restaurant', 'icon': Icons.restaurant_outlined},
    {'value': 'cafe', 'label': 'Café', 'icon': Icons.local_cafe_outlined},
    {'value': 'organization', 'label': 'Organization', 'icon': Icons.business_outlined},
  ];

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final user = ref.read(firebaseAuthProvider).currentUser;
      if (user == null) return;

      final UserRepository repo = ref.read(userRepositoryProvider);

      // Update user display name and phone
      await repo.updateUser(user.uid, {
        'displayName': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'lastActiveAt': FieldValue.serverTimestamp(),
      });

      // Create generator profile
      final GeneratorProfileModel profile = GeneratorProfileModel(
        id: user.uid,
        generatorType: _generatorType,
        canTransportSelf: _canTransportSelf,
      );
      await repo.createGeneratorProfile(profile);

      if (mounted) {
        // Navigate to generator dashboard (we'll create this later)
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    } on Exception catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generator Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Set up your profile', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  'Tell us about yourself so we can match you with the best recyclers.',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),

                // Display name
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Display Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 16),

                // Phone
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone_outlined),
                    hintText: '+961 ...',
                  ),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Phone is required' : null,
                ),
                const SizedBox(height: 24),

                // Generator type selection
                Text(
                  'Type of Generator',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.headlineMedium?.color,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _generatorTypes.map((type) {
                    final bool isSelected =
                        _generatorType == type['value'] as String;
                    return GestureDetector(
                      onTap: () =>
                          setState(() => _generatorType = type['value'] as String),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colors.primary.withOpacity(0.15)
                              : colors.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? colors.primary
                                : colors.outline.withOpacity(0.2),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              type['icon'] as IconData,
                              size: 20,
                              color: isSelected
                                  ? colors.primary
                                  : colors.onSurface.withOpacity(0.6),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              type['label'] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? colors.primary
                                    : colors.onSurface.withOpacity(0.8),
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Transport preference
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'I can transport waste myself',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.textTheme.headlineMedium?.color,
                    ),
                  ),
                  subtitle: Text(
                    'If enabled, you may be matched with drop-off options in addition to pickup.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  value: _canTransportSelf,
                  onChanged: (val) => setState(() => _canTransportSelf = val),
                  activeColor: colors.primary,
                ),
                const SizedBox(height: 40),

                // Submit
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _save,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Complete Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
