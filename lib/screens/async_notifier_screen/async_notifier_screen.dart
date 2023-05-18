import 'package:flutter/material.dart';
import 'package:flutter_river_flow/screens/async_notifier_screen/providers/async_notifier_screen_controller.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncNotifierScreen extends ConsumerWidget {
  const AsyncNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncNotifierScreenControllerProvider);

    return AppScaffold(
      color: Colors.purple,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('AsyncNotifierProvider screen'),
          state.when(
            data: (data) => Text(data),
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('$error'),
          )
        ],
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .resetWord();
            },
            child: const Icon(Icons.delete),
          ),
          FloatingActionButton(
            heroTag: 'get',
            onPressed: () async {
              await ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .setNewWord();
            },
            child: const Icon(Icons.new_releases),
          ),
        ],
      ),
    );
  }
}
