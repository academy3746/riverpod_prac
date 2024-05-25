import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    super.key,
    required this.title,
    required this.screen,
  });

  final String title;

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return screen;
              },
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
