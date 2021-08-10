import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseableCard.dart';
import 'topCards.dart';

const bottomContainerHeight = 80.0;
const activeColour = Color(0xFF1D1E33);
const inactiveColour = Color(0xFF111328);
enum Gender { none, male, female }

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
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
                        ? activeColour
                        : inactiveColour,
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
                        ? activeColour
                        : inactiveColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: activeColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: activeColour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: activeColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEB1555),
            height: bottomContainerHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Calulate Your BMI Here',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
