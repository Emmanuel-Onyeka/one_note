import 'package:flutter/material.dart';
import 'package:one_note_clone/screens/home_page.dart';
import 'package:provider/provider.dart';
import './model/data_class.dart';
import './screens/note_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataClass(),
      child: MaterialApp(
        title: 'OneNote',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff000000),
          appBarTheme: const AppBarTheme(
            color: Color(0xff1e1e1d),
          ),
          primaryColor: const Color(0xff1e1e1d),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          NoteDetailScreen.routeName: (context) => NoteDetailScreen(),
        },
      ),
    );
  }
}
