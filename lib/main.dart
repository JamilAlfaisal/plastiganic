import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/localization/app_localizations.dart';
import 'features/auth/providers/auth_providers.dart';
import 'features/auth/providers/user_repository.dart';
import 'features/auth/views/auth_screen.dart';
import 'features/auth/views/role_selection_screen.dart';
import 'features/dashboard/views/generator_dashboard.dart';
import 'features/dashboard/views/company_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: RecycleLinkApp()));
}

class RecycleLinkApp extends ConsumerWidget {
  const RecycleLinkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'RecycleLink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,

      // Localization
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en', ''), // Default locale; can be changed from settings

      home: const AuthGate(),
    );
  }
}

/// Root auth gate: routes to auth screen, role selection, or appropriate dashboard.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        if (user == null) {
          return const AuthScreen();
        }
        // User is signed in — check if they have a Firestore profile
        return _ProfileRouter(userId: user.uid);
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Auth error: $error')),
      ),
    );
  }
}

/// Checks if the user has a Firestore profile and routes accordingly.
class _ProfileRouter extends ConsumerWidget {
  final String userId;

  const _ProfileRouter({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentUserProfileProvider);

    return profileAsync.when(
      data: (profile) {
        if (profile == null) {
          // User exists in Auth but no Firestore doc yet — send to role selection
          return const RoleSelectionScreen();
        }
        // Route to the correct dashboard based on role
        if (profile.role == 'company') {
          return const CompanyDashboard();
        }
        return const GeneratorDashboard();
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Error loading profile: $error')),
      ),
    );
  }
}
