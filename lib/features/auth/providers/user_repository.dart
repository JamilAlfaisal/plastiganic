import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user_model.dart';
import '../../../models/generator_profile_model.dart';
import '../../../models/company_profile_model.dart';

import 'auth_providers.dart';
export 'auth_providers.dart' show authStateProvider;

/// Provides the Firestore instance.
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

/// Repository for user-related Firestore operations.
class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  CollectionReference<Map<String, dynamic>> get _generatorProfilesCollection =>
      _firestore.collection('generatorProfiles');

  CollectionReference<Map<String, dynamic>> get _companyProfilesCollection =>
      _firestore.collection('companyProfiles');

  /// Create a new user document in Firestore after Firebase Auth signup.
  Future<void> createUser(UserModel user) async {
    await _usersCollection.doc(user.id).set({
      'role': user.role,
      'displayName': user.displayName,
      'photoUrl': user.photoUrl,
      'phone': user.phone,
      'email': user.email,
      'languagePref': user.languagePref,
      'trustScore': 100.0,
      'isVerified': false,
      'createdAt': FieldValue.serverTimestamp(),
      'lastActiveAt': FieldValue.serverTimestamp(),
      'location': {
        'geopoint': user.location.geopoint,
        'geohash': user.location.geohash,
      },
    });
  }

  /// Get a user document by ID.
  Future<UserModel?> getUser(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _usersCollection.doc(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return UserModel.fromJson({...doc.data()!, 'id': doc.id});
  }

  /// Stream a user document by ID.
  Stream<UserModel?> streamUser(String userId) {
    return _usersCollection.doc(userId).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return UserModel.fromJson({...doc.data()!, 'id': doc.id});
    });
  }

  /// Update specific fields of a user document.
  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    await _usersCollection.doc(userId).update(data);
  }

  /// Create a generator profile.
  Future<void> createGeneratorProfile(GeneratorProfileModel profile) async {
    final Map<String, dynamic> data = profile.toJson();
    data.remove('id');
    await _generatorProfilesCollection.doc(profile.id).set(data);
  }

  /// Get a generator profile by userId.
  Future<GeneratorProfileModel?> getGeneratorProfile(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _generatorProfilesCollection.doc(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return GeneratorProfileModel.fromJson({...doc.data()!, 'id': doc.id});
  }

  /// Create a company profile.
  Future<void> createCompanyProfile(CompanyProfileModel profile) async {
    final Map<String, dynamic> data = profile.toJson();
    data.remove('id');
    await _companyProfilesCollection.doc(profile.id).set(data);
  }

  /// Get a company profile by userId.
  Future<CompanyProfileModel?> getCompanyProfile(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> doc =
        await _companyProfilesCollection.doc(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return CompanyProfileModel.fromJson({...doc.data()!, 'id': doc.id});
  }
}

/// Provides the UserRepository instance.
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.watch(firestoreProvider));
});

/// Streams the current user's profile from Firestore.
final currentUserProfileProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.when(
    data: (user) {
      if (user == null) return Stream.value(null);
      return ref.watch(userRepositoryProvider).streamUser(user.uid);
    },
    loading: () => Stream.value(null),
    error: (_, __) => Stream.value(null),
  );
});


