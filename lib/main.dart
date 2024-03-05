import 'package:flutter/material.dart';
import 'package:my_app_feburary/refactor/dog_sqflite.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const CatHomePage()
    );
  }
}

