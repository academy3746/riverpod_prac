import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/state_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class StateScreen extends ConsumerWidget {
  const StateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(number);

    return CommonScaffold(
      title: 'STATE SCREEN',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Status Panel
            Text(provider.toString()),
            const SizedBox(height: 8.0),

            /// Increase
            ElevatedButton(
              onPressed: () => ref.read(number.notifier).update((state) {
                return state + 1;
              }),
              child: const Text('UP'),
            ),
            const SizedBox(height: 16.0),

            /// Decrease
            ElevatedButton(
              onPressed: () {
                ref.read(number.notifier).state =
                    ref.read(number.notifier).state - 1;
              },
              child: const Text('DOWN'),
            ),
          ],
        ),
      ),
    );
  }
}
