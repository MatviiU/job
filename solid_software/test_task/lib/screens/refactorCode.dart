import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_task/screens/main_screen.dart';

class RefactorCode extends StatefulWidget {
  const RefactorCode({super.key});

  @override
  State<RefactorCode> createState() => _RefactorCodeState();
}

class _RefactorCodeState extends State<RefactorCode> {
  bool isDefault = true;
  Color textColor = Colors.black;
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    isDefault = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              isDefault = true;
            });
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text("Generation of random color"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          isDefault = false;
          setState(() {
            backgroundColor = generationOfRandomColor();
            textColor =
                getColorType(backgroundColor!) == ColorType.light
                    ? Colors.black
                    : Colors.white;
          });
        },
        child: Container(
          color: isDefault ? Colors.white : backgroundColor,
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: getText()),
          ),
        ),
      ),
    );
  }

  Color generationOfRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  ColorType getColorType(Color color) {
    return color.computeLuminance() > 0.5 ? ColorType.light : ColorType.dark;
  }

  List<InlineSpan> getText() {
    List<InlineSpan> listOfText = [];
    if (isDefault) {
      listOfText = [
        TextSpan(
          text: 'Hello there\n',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: Colors.black),
        ),
        TextSpan(
          text: 'Tap anywhere on the screen',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ];
    } else {
      listOfText = [
        TextSpan(
          text:
              "Generated color: ${backgroundColor!.toARGB32().toRadixString(16)}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ];
    }
    return listOfText;
  }
}
