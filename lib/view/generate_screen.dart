import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/generate_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class GenerateScreen extends ConsumerWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state01 = ref.watch(gStateProvider);

    final state02 = ref.watch(gStateFutureProvider);

    final state03 = ref.watch(gStateSpotFutureProvider);

    final state04 = ref.watch(
      gStateMultiplyProvider(
        num1: 3,
        num2: 2,
      ),
    );

    final state05 = ref.watch(gStateNotifierProvider);

    return CommonScaffold(
      title: 'RIVERPOD GENERATOR',
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Auto Dispose
            Text(
              'State01: $state01',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),

            /// Future & Auto Dispose
            state02.when(
              data: (data) {
                return Text(
                  'State02: $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
            const SizedBox(height: 16.0),

            /// Keep Alive & Do not Auto Dispose
            state03.when(
              data: (data) {
                return Text(
                  'State03: $data',
                  textAlign: TextAlign.center,
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
            const SizedBox(height: 16.0),

            /// Family Parameters
            Text('State04: $state04'),
            const SizedBox(height: 16.0),

            /// Consumer Widget (Component & Part Rendering)
            Consumer(
              builder: (context, ref, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('State05: $state05'),
                    child ?? Container(),
                  ],
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Say, Hello!'),
              ),
            ),

            /// State Notifier Provider
            // Text('State05: $state05'),
            const SizedBox(height: 12.0),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        ref.read(gStateNotifierProvider.notifier).increment(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      'PLUS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        ref.read(gStateNotifierProvider.notifier).decrement(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      'MINUS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => ref.invalidate(gStateNotifierProvider),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    child: const Text(
                      'INVALIDATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
