import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseableCard.dart';
import 'topCards.dart';

const bottomContainerHeight = 80.0;
const activeColour = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    childCard: TopCards(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: activeColour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    childCard: TopCards(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
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
                    childCard: TopCards(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
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
                    childCard: TopCards(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: activeColour,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    childCard: TopCards(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
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
