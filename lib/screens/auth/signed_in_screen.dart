import 'package:flutter/material.dart';
import 'package:flutter_river_flow/screens/auth/auth_screen_state.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignedInScreen extends ConsumerWidget {
  const SignedInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      color: Colors.purple,
      body: LoaderOverlay(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            height: 400,
            child: Column(
              children: [
                const Text(
                  'You are Signed In!!',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Hello, ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () async {
                    context.loaderOverlay.show();
                    await ref.read(authControllerProvider.notifier).signOut();
                    context.loaderOverlay.hide();
                  },
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
