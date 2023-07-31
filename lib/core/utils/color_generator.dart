import 'dart:math';
import 'package:flutter/material.dart';

/// Color Generator
/// used to generate random RGB or HSV Color
class ColorGenerator {
  /// generate random RGB Color
  static Color generateRandomRGBColor() {
    final randomRColor = Random().nextInt(256);
    final randomGColor = Random().nextInt(256);
    final randomBColor = Random().nextInt(256);

    return Color.fromRGBO(randomRColor, randomGColor, randomBColor, 1);
  }
  /// generate random HSV Color
  static Color generateRandomHSVColor() {
    final hue = Random().nextDouble() * 179;
    const saturation = 0.5;
    const value = 0.95;
    final hsvColor = HSVColor.fromAHSV(1, hue, saturation, value);
    
    return hsvColor.toColor();
  }
}
