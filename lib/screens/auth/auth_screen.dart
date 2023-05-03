import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_river_flow/screens/auth/auth_provider.dart';
import 'package:flutter_river_flow/screens/auth/auth_screen_state.dart';
import 'package:flutter_river_flow/screens/auth/signed_in_screen.dart';
import 'package:flutter_river_flow/screens/auth/widgets/colored_text_field.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nil/nil.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pageState = ref.watch(pageStateProvider);
    final authController = ref.read(authControllerProvider.notifier);
    final authUser = ref.watch(isSignedInProvider);

    void changePageState(PageState state) {
      if (state == PageState.signUp) {
        ref.read(pageStateProvider.notifier).state = PageState.signIn;
      } else {
        ref.read(pageStateProvider.notifier).state = PageState.signUp;
      }
    }

    return authUser.when(
      data: (isSignedIn) {
        if (isSignedIn) {
          return const SignedInScreen();
        }
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
                          obscureText: true,
                          hintText: 'Enter your password',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: pageState == PageState.signIn
                        ? () => authController.signIn()
                        : () => authController.signUp(),
                    child: Text(pageState.name),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => changePageState(pageState),
                    child: Text(
                      getButtonText(pageState),
                      style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, stackTrace) {
        debugPrint('error: $e');
        debugPrint('stackTrace: $stackTrace');
        // return Container();
        return nil;
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }

  String getButtonText(PageState state) {
    switch (state) {
      case PageState.signIn:
        return 'Go to Sign up';
      case PageState.signUp:
        return 'Go to Log in';
    }
  }
}
