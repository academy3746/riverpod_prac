import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/state_notifier_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(shoppingProvider);

    return CommonScaffold(
      title: 'STATE NOTIFIER SCREEN',
      body: ListView(
        children: cont
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought,
                onChanged: (value) {
                  ref.read(shoppingProvider.notifier).boughtToggle(e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
