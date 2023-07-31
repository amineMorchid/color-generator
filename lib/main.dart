import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  return Color.fromRGBO(_generateRandomValue(), _generateRandomValue(),
      _generateRandomValue(), 1);
}

int _generateRandomValue() {
  return Random().nextInt(256);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
