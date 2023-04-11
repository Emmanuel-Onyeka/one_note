import 'package:flutter/material.dart';
import 'package:one_note_clone/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff000000),
        appBarTheme: AppBarTheme(
          color: Color(0xff1e1e1d),
        ),
        primaryColor: Color(0xff1e1e1d),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
