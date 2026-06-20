import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/config/app_config.dart';
import '../../../core/utils/geo_utils.dart';
import '../../../models/company_profile_model.dart';
import '../../../models/user_model.dart';
import '../providers/auth_providers.dart';
import '../providers/user_repository.dart';

class CompanyProfileWizard extends ConsumerStatefulWidget {
  const CompanyProfileWizard({super.key});

  @override
  ConsumerState<CompanyProfileWizard> createState() =>
      _CompanyProfileWizardState();
}

class _CompanyProfileWizardState extends ConsumerState<CompanyProfileWizard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _serviceRadiusController =
      TextEditingController(text: '10');
  final TextEditingController _driverCapacityController =
      TextEditingController(text: '0');

  final Set<String> _selectedCategories = {};
  final Map<String, TextEditingController> _priceControllers = {};
  String _priceCurrency = 'USD';
  bool _hasDrivers = false;
  bool _isLoading = false;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    // Initialize price controllers for each waste category
    for (final String category in AppConfig.wasteCategories) {
      _priceControllers[category] = TextEditingController();
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _serviceRadiusController.dispose();
    _driverCapacityController.dispose();
    for (final controller in _priceControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  String _categoryLabel(String category) {
    return category
        .split('_')
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(' ');
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one waste category.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = ref.read(firebaseAuthProvider).currentUser;
      if (user == null) return;

      final UserRepository repo = ref.read(userRepositoryProvider);

      // Update user display name and phone
      await repo.updateUser(user.uid, {
        'displayName': _companyNameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'lastActiveAt': FieldValue.serverTimestamp(),
      });

      // Build pricePerUnit map
      final Map<String, PriceDetail> pricePerUnit = {};
      for (final String category in _selectedCategories) {
        final String priceText = _priceControllers[category]?.text ?? '0';
        final double price = double.tryParse(priceText) ?? 0;
        pricePerUnit[category] = PriceDetail(
          amount: price,
          currency: _priceCurrency,
          unit: 'kg',
        );
      }

      // Create company profile (isApproved = true at creation per rules)
      final CompanyProfileModel profile = CompanyProfileModel(
        id: user.uid,
        companyName: _companyNameController.text.trim(),
        description: _descriptionController.text.trim(),
        location: GeoLocation(
          geopoint: const GeoPoint(33.8938, 35.5018), // Default: Beirut
          geohash: GeoUtils.encodeGeohash(33.8938, 35.5018),
        ),
        acceptedCategories: _selectedCategories.toList(),
        pricePerUnit: pricePerUnit,
        hasDrivers: _hasDrivers,
        driverCapacityKgPerDay:
            double.tryParse(_driverCapacityController.text) ?? 0,
        serviceRadiusKm:
            double.tryParse(_serviceRadiusController.text) ?? 10,
        isApproved: true,
      );
      await repo.createCompanyProfile(profile);

      if (mounted) {
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
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Profile'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep < 2) {
                setState(() => _currentStep++);
              } else {
                _save();
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() => _currentStep--);
              }
            },
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: _isLoading ? null : details.onStepContinue,
                      child: _isLoading && _currentStep == 2
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(_currentStep == 2 ? 'Complete' : 'Next'),
                    ),
                    if (_currentStep > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                      ),
                  ],
                ),
              );
            },
            steps: [
              // Step 1: Company Info
              Step(
                title: const Text('Company Details'),
                isActive: _currentStep >= 0,
                state:
                    _currentStep > 0 ? StepState.complete : StepState.indexed,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _companyNameController,
                      decoration: const InputDecoration(
                        labelText: 'Company Name',
                        prefixIcon: Icon(Icons.business),
                      ),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        prefixIcon: Icon(Icons.description_outlined),
                        alignLabelWithHint: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone_outlined),
                        hintText: '+961 ...',
                      ),
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Required' : null,
                    ),
                  ],
                ),
              ),

              // Step 2: Categories & Pricing
              Step(
                title: const Text('Categories & Pricing'),
                isActive: _currentStep >= 1,
                state:
                    _currentStep > 1 ? StepState.complete : StepState.indexed,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select waste categories you accept:',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.headlineMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Currency toggle
                    Row(
                      children: [
                        const Text('Pricing currency: '),
                        SegmentedButton<String>(
                          segments: const [
                            ButtonSegment<String>(
                              value: 'USD',
                              label: Text('USD'),
                            ),
                            ButtonSegment<String>(
                              value: 'LBP',
                              label: Text('LBP'),
                            ),
                          ],
                          selected: {_priceCurrency},
                          onSelectionChanged: (val) =>
                              setState(() => _priceCurrency = val.first),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Category chips with price inputs
                    ...AppConfig.wasteCategories.map((category) {
                      final bool isSelected =
                          _selectedCategories.contains(category);
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? colors.primary.withOpacity(0.08)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? colors.primary.withOpacity(0.3)
                                : colors.outline.withOpacity(0.15),
                          ),
                        ),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: Text(_categoryLabel(category)),
                              value: isSelected,
                              activeColor: colors.primary,
                              onChanged: (val) {
                                setState(() {
                                  if (val == true) {
                                    _selectedCategories.add(category);
                                  } else {
                                    _selectedCategories.remove(category);
                                  }
                                });
                              },
                            ),
                            if (isSelected)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                                child: TextFormField(
                                  controller: _priceControllers[category],
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Price per kg ($_priceCurrency)',
                                    prefixIcon:
                                        const Icon(Icons.attach_money),
                                    isDense: true,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),

              // Step 3: Driver & Service Area
              Step(
                title: const Text('Service Area'),
                isActive: _currentStep >= 2,
                content: Column(
                  children: [
                    TextFormField(
                      controller: _serviceRadiusController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Service Radius (km)',
                        prefixIcon: Icon(Icons.radar),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('We have drivers for pickup'),
                      value: _hasDrivers,
                      onChanged: (val) => setState(() => _hasDrivers = val),
                      activeColor: colors.primary,
                    ),
                    if (_hasDrivers)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: TextFormField(
                          controller: _driverCapacityController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Driver capacity (kg/day)',
                            prefixIcon: Icon(Icons.local_shipping_outlined),
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colors.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colors.primary.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline,
                              color: colors.primary, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Your profile will go live immediately. '
                              'Location will default to Beirut — you can update it later on your dashboard.',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
