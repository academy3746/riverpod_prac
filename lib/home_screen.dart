import 'package:flutter/material.dart';
import 'package:riverpod_prac/view/auto_dispose_screen.dart';
import 'package:riverpod_prac/view/family_modifier_screen.dart';
import 'package:riverpod_prac/view/future_screen.dart';
import 'package:riverpod_prac/view/listen_screen.dart';
import 'package:riverpod_prac/view/multiple_screen.dart';
import 'package:riverpod_prac/view/select_screen.dart';
import 'package:riverpod_prac/view/state_notifier_screen.dart';
import 'package:riverpod_prac/view/stream_screen.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';
import 'package:riverpod_prac/widgets/navigate_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'RIVER DUCK',
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20.0),
        child: const Column(
          children: [
            /// StateNotifier Provider
            NavigateButton(
              title: 'STATE',
              screen: StateNotifierScreen(),
            ),

            /// Future Provider
            NavigateButton(
              title: 'FUTURE',
              screen: FutureScreen(),
            ),

            /// Stream Provider
            NavigateButton(
              title: 'STREAM',
              screen: StreamScreen(),
            ),

            /// Family Modifier
            NavigateButton(
              title: 'FAMILY',
              screen: FamilyModifierScreen(),
            ),

            /// Auto Disposer
            NavigateButton(
              title: 'DISPOSE',
              screen: AutoDisposeScreen(),
            ),

            /// Listen Provider
            NavigateButton(
              title: 'LISTEN',
              screen: ListenScreen(),
            ),

            /// Select
            NavigateButton(
              title: 'SELECT',
              screen: SelectScreen(),
            ),

            /// Provider in Provider
            NavigateButton(
              title: 'MULTIPLE',
              screen: MultipleScreen(),
            )
          ],
        ),
      ),
    );
  }
}
