import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_river_flow/screens/auth/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

// Ref: https://zenn.dev/ryota_iwamoto/articles/firebase_auth_and_riverpod
// Ref: https://github.com/mono0926/flutter_firestore_ref/blob/b2ce2a13a2aea2ee86bd5e62b51e4be4429217f3/example/lib/model/service/authenticator.dart

// provider for Auth instance
final authProvider = Provider((ref) => FirebaseAuth.instance);

//
final userStateProvider =
    StreamProvider((ref) => ref.watch(authRepositoryProvider).authStateChanges);

final authUserProvider =
    StreamProvider((ref) => ref.watch(authProvider).userChanges());

final userIdProvider = Provider(
    (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid));

final isSignedInProvider = Provider(
  (ref) => ref.watch(userIdProvider).whenData((id) => id != null),
);

final signInAnonymouslyProvider = FutureProvider(
  (ref) => ref.watch(authProvider).signInAnonymously(),
);
