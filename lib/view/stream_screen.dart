import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/stream_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(context, ref) {
    final cont = ref.watch(streamProvider);

    return CommonScaffold(
      title: 'STREAM SCREEN',
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
