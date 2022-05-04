import 'package:flutter/material.dart';
import 'package:todo_list/views/home.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              primary: Colors.white, backgroundColor: Colors.blueAccent),
        ),
      ),
      home: const MyHomePage(title: 'Todo list'),
    );
  }
}
