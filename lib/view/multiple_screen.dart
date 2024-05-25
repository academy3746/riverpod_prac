import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/multiple_repo.dart';
import 'package:riverpod_prac/repository/state_notifier_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class MultipleScreen extends ConsumerWidget {
  const MultipleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(providerInProvider);

    print(state);

    return CommonScaffold(
      title: 'PROVIDER IN PROVIDER',
      actions: [
        PopupMenuButton<FilteredStatus>(
          color: Colors.white,
          itemBuilder: (context) {
            return FilteredStatus.values
                .map((e) => PopupMenuItem(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList();
          },
          onSelected: (value) {
            ref.read(filteredProvider.notifier).update((state) => value);
          },
        ),
      ],
      body: ListView(
        children: state
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
