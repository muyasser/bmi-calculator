import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const BottomButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        //padding: EdgeInsets.only(bottom: 20),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainerColor,
        child: Center(
          child: Text(
            title,
            style: kLrgeButtonTextStyle,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
