import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_prac/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RiverApp(),
    ),
  );
}

class RiverApp extends StatelessWidget {
  const RiverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River App',
      theme: ThemeData(
        primaryColor: Colors.black,
        useMaterial3: true,
        iconTheme: const IconThemeData(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
