import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/auto_dispose_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class AutoDisposeScreen extends ConsumerWidget {
  const AutoDisposeScreen({super.key});

  @override
  Widget build(context, ref) {
    final cont = ref.watch(disposeProvider);

    return CommonScaffold(
      title: 'AUTO DISPOSE SCREEN',
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
