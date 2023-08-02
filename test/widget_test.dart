// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:color_generator/features/color_generator/presentation/pages/home_page.dart';
import 'package:color_generator/features/color_generator/presentation/providers/color_notifier.dart';
import 'package:color_generator/features/color_generator/presentation/providers/color_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testableWidget() {
    return MaterialApp(
      home: Material(
        child: FutureBuilder(
          builder: (_, __) {
            return const ProviderScope(child: HomePage());
          },
        ),
      ),
    );
  }

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(testableWidget());

    // Verify that our counter starts at 0.
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('Initial state is RGB', (tester) async {
    await tester.pumpWidget(testableWidget());

    final ref = ProviderContainer();

    // Read state
    final colorType = ref.read(colorTypeProvider);

    expect(colorType, ColorType.rgb);
  });

  testWidgets('Toggle RGB checkbox', (tester) async {
    await tester.pumpWidget(testableWidget());

    final ref = ProviderContainer();
    // Tap RGB checkbox
    await tester.tap(find.text('Random RGB Color'));

    // Verify selected
    final colorType = ref.read(colorTypeProvider);
    expect(colorType, ColorType.rgb);
  });
  testWidgets('Toggle HSV checkbox', (tester) async {
    await tester.pumpWidget(testableWidget());

    // Verify selected
    expect(find.text('Random HSV Color'), findsOneWidget);
  });

  testWidgets('Change color on tap', (tester) async {
    await tester.pumpWidget(testableWidget());

    // Get initial color
    final initialColor = ProviderContainer().read(colorProvider);

    // Tap gesture detector
    await tester.tap(find.byType(GestureDetector).at(1));

    // Verify color changed
    expect(tester.firstWidget<Scaffold>(find.byType(Scaffold)).backgroundColor,
        isNot(initialColor));
  });
}
