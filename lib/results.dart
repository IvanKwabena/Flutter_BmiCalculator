import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text('DATA'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class Button extends StatefulWidget {
  Button({required this.child, this.onPressed});
  final Text child;
  final Function? onPressed;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('data'),
      onPressed: () {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InputPage()));
        });
      },
    );
  }
}
