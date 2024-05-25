import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/repository/listen_repo.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class ListenScreen extends ConsumerStatefulWidget {
  const ListenScreen({super.key});

  @override
  ConsumerState<ListenScreen> createState() => _ListenScreenState();
}

class _ListenScreenState extends ConsumerState<ListenScreen>
    with TickerProviderStateMixin {
  late TabController tabCont;

  @override
  void initState() {
    super.initState();

    tabCont = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listen),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(
      listen,
      (prev, next) {
        if (prev != next) {
          tabCont.animateTo(next);
        }
      },
    );

    return CommonScaffold(
      title: 'LISTEN PROVIDER SCREEN',
      body: TabBarView(
        controller: tabCont,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          10,
          (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  index.toString(),
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    ref.read(listen.notifier).update(
                          (cb) => cb == 10 ? 10 : cb + 1,
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text(
                    'NEXT!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    ref.read(listen.notifier).update(
                          (cb) => cb == 0 ? 0 : cb - 1,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  child: const Text(
                    'PREV!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
