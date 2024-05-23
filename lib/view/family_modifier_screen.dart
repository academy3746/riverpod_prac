import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/family_modifier_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(context, ref) {
    final cont = ref.watch(family(5));

    return CommonScaffold(
      title: 'FAMILY MODIFIER SCREEN',
      body: Center(
        child: cont.when(
          data: (data) => Text(data.toString()),
          error: (error, stack) => Text(error.toString()),
          loading: () {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
