import 'package:flutter/material.dart';

AnimatedDefaultTextStyle animatedText(fontSize, onEnd, color, currentIndex) {
  return AnimatedDefaultTextStyle(
      onEnd: () => onEnd(fontSize),
      style: TextStyle(color: color, fontSize: fontSize, shadows: const [
        Shadow(
          color: Colors.black,
          blurRadius: 0,
          offset: Offset(2, 2),
        )
      ]),
      duration: Duration(milliseconds: 100),
      child: Text('$currentIndex'));
}
