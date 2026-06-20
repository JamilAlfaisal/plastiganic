import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/geo_utils.dart';
import '../../../models/user_model.dart';
import '../providers/auth_providers.dart';
import '../providers/user_repository.dart';
import 'generator_profile_wizard.dart';
import 'company_profile_wizard.dart';

class RoleSelectionScreen extends ConsumerStatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  ConsumerState<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends ConsumerState<RoleSelectionScreen> {
  bool _isLoading = false;

  Future<void> _selectRole(String role) async {
    setState(() => _isLoading = true);

    try {
      final user = ref.read(firebaseAuthProvider).currentUser;
      if (user == null) return;

      final UserModel userModel = UserModel(
        id: user.uid,
        role: role,
        displayName: user.displayName ?? '',
        email: user.email ?? '',
        phone: '',
        location: GeoLocation(
          geopoint: const GeoPoint(0, 0),
          geohash: GeoUtils.encodeGeohash(0, 0),
        ),
        createdAt: DateTime.now(),
        lastActiveAt: DateTime.now(),
        trustScore: 100,
        isVerified: false,
      );

      await ref.read(userRepositoryProvider).createUser(userModel);

      if (!mounted) return;

      if (role == 'generator') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const GeneratorProfileWizard(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const CompanyProfileWizard(),
          ),
        );
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome to\nRecycleLink',
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'Choose how you want to use the app',
                style: theme.textTheme.bodyLarge,
              ),
              const Spacer(),

              // Generator Card
              _RoleCard(
                icon: Icons.home_outlined,
                title: 'Waste Generator',
                subtitle: 'Household, restaurant, café, or organization producing recyclable waste',
                gradient: [colors.primary, const Color(0xFF059669)],
                isLoading: _isLoading,
                onTap: () => _selectRole('generator'),
              ),
              const SizedBox(height: 16),

              // Company Card
              _RoleCard(
                icon: Icons.business_outlined,
                title: 'Recycling Company',
                subtitle: 'Company that collects, processes, and recycles waste materials',
                gradient: [colors.secondary, const Color(0xFF6366F1)],
                isLoading: _isLoading,
                onTap: () => _selectRole('company'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> gradient;
  final bool isLoading;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: gradient[0].withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withValues(alpha: 0.7),
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
