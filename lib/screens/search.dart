import 'package:flutter/material.dart';
import 'package:one_note_clone/screens/notebook_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 12.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for Note',
                      icon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                      ),
                      iconColor: Colors.white54),
                  onChanged: (value) {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('OneNote: t(6)'),
            ),
            Expanded(
              child: ListView(
                children: [
                  NoteBookView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
