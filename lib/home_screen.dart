import 'package:flutter/material.dart';
import 'package:riverpod_prac/view/future_screen.dart';
import 'package:riverpod_prac/view/state_notifier_screen.dart';
import 'package:riverpod_prac/view/stream_screen.dart';
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'STATE!',
                style: TextStyle(color: Colors.white),
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'FUTURE!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),

            /// Stream Provider
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const StreamScreen();
                  },
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'STREAM!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
