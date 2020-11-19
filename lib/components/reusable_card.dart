import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {@required this.colour,
      this.cardChild,
      this.onPress,
      this.margin = 5.0,
      this.borderRadius = 5.0});

  final Color colour;
  final double margin;
  final double borderRadius;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: colour,
        ),
      ),
    );
  }
}
