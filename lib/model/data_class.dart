import 'package:flutter/foundation.dart';
import 'note_model.dart';

class DataClass extends ChangeNotifier {
  List<Note> _userNotesList = [
    Note(
      id: DateTime.now().toIso8601String(),
      title: 'Learning Schedule',
      body: 'MVVM, folder structure, Restful APIs',
      category: 'Programing',
      dateCreated: DateTime.now(),
    ),
    Note(
      id: DateTime.now().toIso8601String(),
      title: 'Learning Schedule',
      body: 'MVVM, folder structure, Restful APIs',
      category: 'Learning',
      dateCreated: DateTime.now(),
    ),
    Note(
      id: DateTime.now().toIso8601String(),
      title: 'Learning Schedule',
      body: 'MVVM, folder structure, Restful APIs',
      category: 'Flutter',
      dateCreated: DateTime.now(),
    ),
    Note(
      id: DateTime.now().toIso8601String(),
      title: 'Learning Schedule',
      body: 'MVVM, folder structure, Restful APIs',
      category: 'Python',
      dateCreated: DateTime.now(),
    ),
    Note(
      id: DateTime.now().toIso8601String(),
      title: 'Learning Schedule',
      body: 'MVVM, folder structure, Restful APIs',
      category: 'Flutter',
      dateCreated: DateTime.now(),
    ),
  ];

  List<Note> get userList {
    return _userNotesList;
  }

  void addNote(Note note) {
    _userNotesList.add(note);

    notifyListeners();
  }

  List<String> get getNoteCategories {
    List<String> categories = [];
    _userNotesList.forEach((element) {
      categories.add(element.category);
    });
    return categories;
  }

  List<Note> sortNoteByCategory(String cat) {
    List<Note> note =
        _userNotesList.where((element) => element.category == cat).toList();
    // _userNotesList.forEach((element) {
    //   if (element.category == cat) {
    //     note.add(element);
    //   }
    // });
    return note;
  }

  Note findNoteById(String id) {
    return _userNotesList.firstWhere(
      (element) => element.id == id,
    );
  }
}
