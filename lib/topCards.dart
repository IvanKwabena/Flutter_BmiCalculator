import 'package:flutter/material.dart';
import 'constants.dart';

class TopCards extends StatelessWidget {
  const TopCards({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(label, style: kLabelStyleTop)
      ],
    );
  }
}
