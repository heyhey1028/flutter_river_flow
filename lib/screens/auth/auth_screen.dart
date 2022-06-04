import 'package:flutter/material.dart';
import 'package:flutter_river_flow/screens/auth/auth_screen_state.dart';
import 'package:flutter_river_flow/screens/auth/widgets/colored_text_field.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      color: Colors.pink,
      body: Center(
        child: Container(
          width: double.infinity,
          height: 360,
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ColoredTextField(
                        controller: ref.watch(emailProvier),
                        icon: Icons.email,
                        color: Colors.white,
                        hintText: 'Enter your email'),
                    const SizedBox(height: 30),
                    ColoredTextField(
                      controller: ref.watch(passwordProvier),
                      icon: Icons.password,
                      color: Colors.white,
                      hintText: 'Enter your password',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => null,
                child: const Text('Sign up / Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
