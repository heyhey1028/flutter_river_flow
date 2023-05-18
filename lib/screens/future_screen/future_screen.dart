import 'package:flutter/material.dart';
import 'package:flutter_river_flow/screens/future_screen/provider/future_screen_controller.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(futureScreenControllerProvider);

    return AppScaffold(
      color: Colors.brown,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Future Provider page'),
            state.when(
              data: (data) => Text(data),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
