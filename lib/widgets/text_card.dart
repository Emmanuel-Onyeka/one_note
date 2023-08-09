import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String label;
  Color? colour;

  BuildText({super.key, required this.label, this.colour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Text(
        label,
      ),
    );
  }
}
