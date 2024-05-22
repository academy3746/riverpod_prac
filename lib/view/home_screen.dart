import 'package:flutter/material.dart';
import 'package:riverpod_prac/view/state_screen.dart';
import 'package:riverpod_prac/widgets/common_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'HOME SCREEN',
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const StateScreen();
              },
            ),
          ),
          child: const Text('GO!'),
        ),
      ),
    );
  }
}
