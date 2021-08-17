// import 'dart:html';

import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseableCard.dart';
import 'topCards.dart';
import 'constants.dart';

enum Gender { none, male, female }

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int bmiHeight = 190;
  int bmiWeight = 60;
  int bmiAge = 23;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childCard: TopCards(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? kActiveColour
                        : kInactiveColour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    childCard: TopCards(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveColour
                        : kInactiveColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // HEIGHT CARD
                Expanded(
                  child: ReuseableCard(
                    colour: kActiveColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kLabelStyleTop,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              bmiHeight.toString(),
                              style: kLabelStyleMiddle,
                            ),
                            Text(
                              'cm',
                              style: kLabelStyleTop,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: kInactiveTrackColour,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 23.0),
                            overlayColor: Color(0x29EB1555),
                            thumbColor: Color(0xFFEB1555),
                          ),
                          child: Slider(
                            value: bmiHeight.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                bmiHeight = newValue.toInt();
                              });
                            },
                            min: 180.0,
                            max: 220.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //BOTTOM LEFT CARD
                  child: ReuseableCard(
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelStyleTop,
                        ),
                        Text(
                          bmiWeight.toString(),
                          style: kLabelStyleMiddle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (bmiWeight != 20) {
                                    bmiWeight--;
                                  } else {
                                    bmiWeight = 20;
                                  }
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    if (bmiWeight != 150) {
                                      bmiWeight++;
                                    } else {
                                      bmiWeight = 150;
                                    }
                                  });
                                },
                                iconData: FontAwesomeIcons.plus)
                          ],
                        )
                      ],
                    ),
                    colour: kActiveColour,
                  ),
                ),
                Expanded(
                  //BOTTOM RIGHT CARD
                  child: ReuseableCard(
                    colour: kActiveColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelStyleTop,
                        ),
                        Text(
                          bmiAge.toString(),
                          style: kLabelStyleMiddle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (bmiAge != 1) {
                                    bmiAge--;
                                  } else {
                                    bmiAge = 1;
                                  }
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  if (bmiAge != 100) {
                                    bmiAge++;
                                  } else {
                                    bmiAge = 100;
                                  }
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
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
          GestureDetector(
            onTap: () {
              Calculator bmiResults =
                  Calculator(height: bmiHeight, weight: bmiWeight);
              bmiResults.calculateBMi();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiCalc: bmiResults.calculateBMi(),
                      bmiResult: bmiResults.getResult(),
                      bmiInterpretation: bmiResults.getInterpretation()),
                ),
              );
            },
            child: BottomButton(
              buttonName: 'Calculate Your BMI',
            ),
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonName});
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEB1555),
      height: kBottomContainerHeight,
      width: double.infinity,
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.onPressed, required this.iconData});
  final Function() onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xFF4C4F5E),
      child: Icon(iconData),
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      // splashColor: Color(0xFFEB1555),
    );
  }
}
