import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../model/note_model.dart';
import '../model/data_class.dart';

class NoteDetailScreen extends StatefulWidget {
  NoteDetailScreen({Key? key}) : super(key: key);
  static const routeName = 'NoteDetailsScreen';

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  final _titleController = TextEditingController();

  final _categoryController = TextEditingController();

  final _textController = TextEditingController();
  bool _is_init = false;

  Note currentNote = Note(
    id: '',
    title: '',
    body: '',
    category: '',
    dateCreated: DateTime.now(),
  );

  // var _initValue = {
  //   'title': '',
  //   'category': '',
  //   'body': '',
  // };

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _categoryController.dispose();
    _textController.dispose();
  }

  @override
  void didChangeDependencies() {
    var noteId = ModalRoute.of(context)?.settings.arguments as dynamic;
    if (noteId != null) {
      currentNote =
          Provider.of<DataClass>(context, listen: false).findNoteById(noteId);

      // _initValue = {
      //   'title': currentNote.title,
      //   'category': currentNote.category,
      //   'body': currentNote.body,
      // };
      _titleController.text = currentNote.title;
      _categoryController.text = currentNote.category;
      _textController.text = currentNote.body;
    }
    _is_init = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<DataClass>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            onPressed: () {
              String title = _titleController.text;
              String category = _categoryController.text;
              String text = _textController.text;

              Note newNote = Note(
                id: DateTime.now().toString(),
                title: title.trim(),
                body: text.trim(),
                category: category.trim(),
                dateCreated: DateTime.now(),
              );

              data.addNote(newNote);
            },
            icon: const Icon(
              Icons.save,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      labelStyle: kNormalTextStyle,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Category',
                      labelStyle: kNormalTextStyle,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
            TextField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Enter your note....',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
