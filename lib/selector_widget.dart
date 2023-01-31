import 'package:flutter/material.dart';

class Selector extends StatelessWidget {
  final MaterialAccentColor color;
  final Function onTap;
  final double height;
  const Selector(this.color, this.onTap, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedContainer(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 600),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          height: height,
          width: 200,
        ),
      ),
    );
  }
}
