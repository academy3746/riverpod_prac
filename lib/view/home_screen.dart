import 'package:flutter/material.dart';
import 'package:riverpod_prac/view/future_screen.dart';
import 'package:riverpod_prac/view/state_notifier_screen.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'HOME SCREEN',
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// StateNotifier Provider
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const StateNotifierScreen();
                  },
                ),
              ),
              child: const Text('STATE!'),
            ),
            const SizedBox(height: 16.0),

            /// Future Provider
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FutureScreen();
                  },
                ),
              ),
              child: const Text('FUTURE!'),
            ),
          ],
        ),
      ),
    );
  }
}
