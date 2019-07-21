import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/reusable_card.dart';
import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResults;
  final String resultText;
  final String advices;

  const ResultsPage(
      {@required this.bmiResults,
      @required this.resultText,
      @required this.advices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //title: Text('BMI CALCULATOR'),
        actions: <Widget>[],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResults,
                    style: kBMIltTextStyle,
                  ),
                  Text(
                    advices,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RECALCULATE',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
