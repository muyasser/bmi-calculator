import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onTap;

  ReusableCard({@required this.color, this.cardChild, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
      onTap: onTap,
    );
  }
}
