import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/new_state_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class ShoppingScreen extends ConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(shopping);

    return CommonScaffold(
      title: 'SHOPPING SCREEN',
      body: ListView(
        children: cont
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                value: e.hasBought,
                onChanged: (value) {
                  ref.read(shopping.notifier).boughtToggle(e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
