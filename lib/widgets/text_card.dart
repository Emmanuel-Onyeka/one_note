import 'package:flutter/material.dart';

class BuildText extends StatefulWidget {
  final String label;
  Color? colour;

  //Todo: Change the color of the text widget

  BuildText({required this.label, this.colour});

  @override
  State<BuildText> createState() => _BuildTextState();
}

class _BuildTextState extends State<BuildText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: widget.colour,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.label,
        ),
      ),
    );
  }
}
