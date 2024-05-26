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
          ],
        ),
      ),
    );
  }
}
