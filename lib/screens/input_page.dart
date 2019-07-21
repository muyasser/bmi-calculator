import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../widgets/round_icon_button.dart';
import '../calc_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 180;

  int weight = 70;

  int age = 18;

  void selectMale() {
    setState(() {
      selectedGender = Gender.male;
    });
  }

  void selectFemale() {
    setState(() {
      selectedGender = Gender.female;
    });
  }

  void navigateToResultsPage() {
    CalcBrain data = CalcBrain(height, weight);
    //Navigator.of(context).pushNamed('/results', arguments: data);
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => ResultsPage(
              bmiResults: data.calcBmi(),
              resultText: data.getResults(),
              advices: data.getAdvices(),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(Icons.sort),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      label: 'male',
                      icon: FontAwesomeIcons.mars,
                    ),
                    onTap: selectMale,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      label: 'female',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onTap: selectFemale,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            color: Color(0xFF1D1F33),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 26,
                    ),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Color(0xFFEB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          new BottomButton(
            title: 'CALCULATE',
            onTap: navigateToResultsPage,
          ),
        ],
      ),
    );
  }
}
