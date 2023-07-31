import 'package:color_generator/features/color_generator/presentation/providers/color_notifier.dart';
import 'package:color_generator/features/color_generator/presentation/providers/color_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// HomePage Screen
class HomePage extends ConsumerWidget {
  /// init HomePage
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTypeNotifier = ref.read(colorTypeProvider.notifier);
    final colorNotifier = ref.read(colorProvider.notifier);

    final colorGeneratorType = ref.watch(colorTypeProvider);
    final backgroundColor = ref.watch(colorProvider);

    return GestureDetector(
      onTap: () => colorNotifier.generateColor(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            const Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: colorGeneratorType == ColorType.rgb,
                      onChanged: (value) =>
                          colorTypeNotifier.state = ColorType.rgb,
                    ),
                    const Text("Random RGB Color"),
                    Checkbox(
                      value: colorGeneratorType == ColorType.hsv,
                      onChanged: (value) =>
                          colorTypeNotifier.state = ColorType.hsv,
                    ),
                    const Text("Random HSV Color"),
                  ],
                ),
              ),
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
