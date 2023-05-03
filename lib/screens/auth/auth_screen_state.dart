import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_river_flow/screens/auth/auth_repository.dart';

final emailProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

final passwordProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

enum PageState {
  signUp,
  signIn;

  String get name {
    switch (this) {
      case PageState.signUp:
        return 'Sign up';
      case PageState.signIn:
        return 'Sign in';
    }
  }
}

final pageStateProvider = StateProvider<PageState>(((ref) => PageState.signUp));

final authControllerProvider =
    StateNotifierProvider.autoDispose<AuthController, User?>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<User?> {
  final AutoDisposeStateNotifierProviderRef<AuthController, User?> ref;

  AuthController(this.ref) : super(null);

  @override
  User? get state => ref.read(authRepositoryProvider).getCurrentUser();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> signIn() async {
    try {
      final email = ref.watch(emailProvier).text;
      final password = ref.watch(passwordProvier).text;
      debugPrint('email: $email');
      debugPrint('password: $password');
      await ref
          .read(authRepositoryProvider)
          .signInWithEmail(email, password)
          .then((value) {
        ref.read(emailProvier).clear();
        ref.read(passwordProvier).clear();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signUp() async {
    final email = ref.watch(emailProvier).text;
    final password = ref.watch(passwordProvier).text;
    debugPrint('email: $email');
    debugPrint('password: $password');
    await ref
        .read(authRepositoryProvider)
        .signUp(email, password)
        .then((value) {
      ref.read(emailProvier).clear();
      ref.read(passwordProvier).clear();
    });
    // Firestoreにユーザデータを追加したり
  }

  Future<void> signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}
