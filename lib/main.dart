import 'dart:math';
import 'package:animated_character_selector/selector_widget.dart';
import 'package:flutter/material.dart';

import 'animated_text.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int currentIndex = 0;
double fontSize = 80;
double binSize = 40;
final List<MaterialAccentColor> items =
    List.generate(6, (index) => Colors.accents[Random(index).nextInt(15)]);
var color = items[0];

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          animatedText(fontSize, () {
            return setState(() => fontSize = 90);
          }, color, currentIndex),
          Expanded(
            child: PageView.builder(
                onPageChanged: (val) => setState(() {
                      currentIndex = val;
                    }),
                controller: PageController(viewportFraction: 0.6),
                itemCount: items.length,
                itemBuilder: ((context, index) {
                  color = items[index];
                  fontSize = fontSize == 80 ? 80 : 90;
                  return Draggable(
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    data: index,
                    feedback: Selector(
                        items[index], () {}, currentIndex == index ? 300 : 200),
                    childWhenDragging: SizedBox(),
                    child: Selector(
                        items[index], () {}, currentIndex == index ? 300 : 200),
                  );
                })),
          ),
          SizedBox(
            height: 40,
          ),
          DragTarget<int>(
            onAcceptWithDetails: (details) => setState(() {
              items.removeAt(details.data);
              binSize += 20;
            }),
            builder: (context, candidateData, rejectedData) => Icon(
              Icons.delete_outline,
              color: Colors.black,
              size: binSize,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
