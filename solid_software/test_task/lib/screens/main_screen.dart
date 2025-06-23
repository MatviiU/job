import 'dart:math';

import 'package:flutter/material.dart';

enum ColorType { light, dark }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;

  ColorType getColorType(Color color) {
    return color.computeLuminance() > 0.5 ? ColorType.light : ColorType.dark;
  }

  @override
  Widget build(BuildContext context) {
    Color generationOfRandomColor() {
      final random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    Widget content = Center(
      child: Text(
        "Generated color: ${backgroundColor.toARGB32().toRadixString(16)}",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (backgroundColor == Colors.white) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hello there",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: textColor),
            ),
            const SizedBox(height: 16),
            Text(
              "Tap anywhere on the screen",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            setState(() {
              backgroundColor = Colors.white;
              textColor = Colors.black;
            });
          },
        ),
        title: const Text("Generation of random color"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            backgroundColor = generationOfRandomColor();
            textColor =
                getColorType(backgroundColor) == ColorType.light
                    ? Colors.black
                    : Colors.white;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          color: backgroundColor,
          child: content,
        ),
      ),
    );
  }
}
