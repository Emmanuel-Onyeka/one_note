import 'package:flutter/material.dart';
import 'package:one_note_clone/constants.dart';
import 'package:one_note_clone/screens/note_details_screen.dart';
import 'package:provider/provider.dart';
import '../model/data_class.dart';

class NoteBookCatList extends StatelessWidget {
  final category;

  NoteBookCatList(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: kNormalTextStyle,
        ),
      ),
      body: Consumer<DataClass>(
        builder: (ctx, data, child) {
          var notes = data.sortNoteByCategory(category);
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (ctx, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        NoteDetailScreen.routeName,
                        arguments: notes[index].id,
                      );
                    },
                    title: Text(notes[index].body),
                    subtitle: Text(notes[index].title),
                  ),
                  const Divider(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
