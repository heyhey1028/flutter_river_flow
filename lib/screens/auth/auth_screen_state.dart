import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final emailProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

final passwordProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

enum PageState {
  signUp,
  logIn;

  String get name {
    switch (this) {
      case PageState.signUp:
        return 'Sign up';
      case PageState.logIn:
        return 'Log in';
    }
  }
}

final pageStateProvider = StateProvider<PageState>(((ref) => PageState.signUp));
