import 'package:flutter/material.dart';
import 'package:one_note_clone/constants.dart';

class NoteBook extends StatefulWidget {
  const NoteBook({Key? key}) : super(key: key);

  @override
  State<NoteBook> createState() => _NoteBookState();
}

class _NoteBookState extends State<NoteBook> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.note,
        color: Colors.purple,
      ),
      title: Text('My NoteBook'),
      trailing: Text(
        'Default',
        style: kSmallTextStyle,
      ),
    );
  }
}
