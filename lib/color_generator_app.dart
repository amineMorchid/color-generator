import 'package:color_generator/features/color_generator/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

/// The main App
class ColorGeneratorApp extends StatelessWidget {
  /// init ColorGeneratorApp
  const ColorGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
