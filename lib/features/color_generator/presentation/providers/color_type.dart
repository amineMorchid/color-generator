import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Color type enum 
/// used to know which algorithm to use to generate random color
enum ColorType {
  /// color based on red, green, blue
  rgb,
  /// color based on hue, saturation, value
  hsv
}

/// provider to manage color type state
final colorTypeProvider =
    StateProvider((ref) => ColorType.rgb);
    
