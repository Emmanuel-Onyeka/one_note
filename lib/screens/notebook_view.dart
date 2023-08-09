import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:one_note_clone/constants.dart';
import '../model/data_class.dart';
import './notebookListScreen.dart';

class NoteBookView extends StatefulWidget {
  const NoteBookView({Key? key}) : super(key: key);

  @override
  State<NoteBookView> createState() => _NoteBookViewState();
}

class _NoteBookViewState extends State<NoteBookView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(
      builder: (ctx, data, child) => ListView.builder(
          itemCount: data.getNoteCategories.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NoteBookCatList(
                      data.getNoteCategories[index],
                    ),
                  ),
                );
              },
              leading: const Icon(
                Icons.note,
                color: Colors.purple,
              ),
              title: Text(
                data.getNoteCategories[index],
              ),
              trailing: const Text(
                'Default',
                style: kSmallTextStyle,
              ),
            );
          }),
    );
  }
}
