// import 'package:bmi_calculator/input_page.dart';
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
