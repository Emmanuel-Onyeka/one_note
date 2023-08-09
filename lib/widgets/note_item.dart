import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/note_details_screen.dart';
import '../screens/note_details_screen.dart';

class NoteBookItem extends StatelessWidget {
  final notes;

  const NoteBookItem({Key? key, this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          NoteDetailScreen.routeName,
          arguments: notes.id,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'my Notes',
                    style: kSmallTextStyle,
                  ),
                  const SizedBox(width: 3.0),
                  const Icon(
                    Icons.keyboard_double_arrow_right,
                    size: 9.0,
                  ),
                  const SizedBox(width: 3.0),
                  Text(
                    notes.category,
                    style: kSmallTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(notes.title),
              const SizedBox(height: 5.0),
              Text(notes.body),
              const SizedBox(height: 7.0),
              Row(
                children: [
                  Container(
                    height: 20.0,
                    width: 15.0,
                    color: const Color(0xffbfaae3),
                    child: Icon(
                      Icons.subject,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 12.0,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text(
                    'Notebook page',
                    style: kSmallTextStyle,
                  ),
                  const Spacer(),
                  Text(notes.dateCreated.toIso8601String()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
