import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

final emailProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));

final passwordProvier =
    StateProvider.autoDispose((ref) => TextEditingController(text: ''));
