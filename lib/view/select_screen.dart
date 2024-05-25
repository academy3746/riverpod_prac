import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/select_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class SelectScreen extends ConsumerWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectProvider);

    final spicy = ref.watch(
      selectProvider.select((value) => value.isSpicy),
    );

    print('BUILD');

    var cont = ref.read(selectProvider.notifier);

    return CommonScaffold(
      title: 'SELECT PROVIDER SCREEN',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.name,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              '맵기: $spicy',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              '구매 여부: ${state.hasBought}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),

            /// State Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ElevatedButton(
                onPressed: () => cont.toggleIsSpicy(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: const Text(
                  'SPICY!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ElevatedButton(
                onPressed: () => cont.toggleHasBought(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: const Text(
                  'BOUGHT!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
