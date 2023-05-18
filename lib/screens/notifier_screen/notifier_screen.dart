import 'package:flutter/material.dart';
import 'package:flutter_river_flow/screens/notifier_screen/provider/notifier_screen_controller.dart';
import 'package:flutter_river_flow/widgets/app_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifierScreen extends ConsumerWidget {
  const NotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notifierScreenControllerProvider);

    return AppScaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Sample page'),
          Text('$state'),
        ],
      )),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(notifierScreenControllerProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'async',
            onPressed: () async {
              await ref
                  .read(notifierScreenControllerProvider.notifier)
                  .incrementAsync();
            },
            child: const Icon(Icons.spa),
          ),
        ],
      ),
    );
  }
}
