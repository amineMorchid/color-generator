import 'dart:ui';

import 'package:color_generator/core/utils/color_generator.dart';
import 'package:color_generator/features/color_generator/presentation/providers/color_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Color Notifier for storing color
/// allow to generate color based on the color type
class ColorNotifier extends StateNotifier<Color> {
  /// riverpod ref
  final Ref ref;

  /// init the state with random RGB color as default state
  ColorNotifier(this.ref) : super(ColorGenerator.generateRandomRGBColor());

  /// Generate color based on the color type
  void generateColor() {
    final colorGeneratorType =
        ref.read(colorTypeProvider.notifier).state;
    if (colorGeneratorType == ColorType.rgb) {
      state = ColorGenerator.generateRandomRGBColor();
    } else if (colorGeneratorType == ColorType.hsv) {
      state = ColorGenerator.generateRandomHSVColor();
    }
  }
}

/// provider for managing color state
final colorProvider = StateNotifierProvider<ColorNotifier, Color>((ref) {
  return ColorNotifier(ref);
});
