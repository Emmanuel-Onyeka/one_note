import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'note_model.dart';

class DataClass extends ChangeNotifier {
  var _db_notes = FirebaseFirestore.instance.collection('notes');

  List<Note> _userNotesList = [];

  List<Note> get userList {
    return _userNotesList;
  }

  void addNote(Note note) async {
    var db_response = await _db_notes.add({
      'title': note.title,
      'category': note.category,
      'body': note.body,
      'dateCreated': Timestamp.fromDate(note.dateCreated),
    });

    Note newNote = Note(
      id: db_response.id,
      title: note.title,
      body: note.body,
      category: note.category,
      dateCreated: note.dateCreated,
    );
    _userNotesList.add(newNote);

    notifyListeners();
  }

  Future<void> setNote() async {
    var db = await _db_notes.get();
    List<Map<String, dynamic>> extractedData = [];
    List<Note> db_notes_list = [];

    db.docs.forEach((element) {
      var date = element.data()['dateCreated'] as Timestamp;
      db_notes_list.add(Note(
        id: element.id,
        title: element.data()['title'],
        body: element.data()['body'],
        category: element.data()['category'],
        dateCreated: date.toDate(),
      ));
    });
    _userNotesList = db_notes_list;
    notifyListeners();
  }

  List<String> get getNoteCategories {
    List<String> categories = [];
    _userNotesList.forEach((element) {
      categories.add(element.category);
    });
    return categories.toSet().toList();
  }

  List<Note> sortNoteByCategory(String cat) {
    List<Note> note =
        _userNotesList.where((element) => element.category == cat).toList();
    // _userNotesList.forEach((element) {
    //   if (element.category == cat) {
    //     note.add(element);
    //   }List<int> uniqueNumbers = numbers.toSet().toList();
    // });
    return note;
  }

  Note findNoteById(String id) {
    return _userNotesList.firstWhere(
      (element) => element.id == id,
    );
  }

  Future<void> updateNote(String noteId, Note note) async {
    await _db_notes.doc(noteId).set({
      'title': note.title,
      'category': note.category,
      'body': note.body,
      'dateCreated': Timestamp.fromDate(note.dateCreated),
    });

    int noteIndex = _userNotesList.indexWhere(
      (element) => element.id == noteId,
    );
    _userNotesList[noteIndex] = note;

    notifyListeners();
  }

  Future<void> deleteNote(String id) async {
    await _db_notes.doc(id).delete();

    int noteIndex = _userNotesList.indexWhere(
      (element) => element.id == id,
    );
    _userNotesList.removeAt(noteIndex);

    notifyListeners();
  }
}
