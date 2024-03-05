import 'package:flutter/material.dart';
import 'package:my_app_feburary/refactor/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CatHomePage extends StatefulWidget {
  const CatHomePage({super.key});

  @override
  State<CatHomePage> createState() => _CatHomePageState();
}

class _CatHomePageState extends State<CatHomePage> {
  

  @override
  void initState() {
    super.initState();
    databaseFactory.getDatabasesPath() as Database;
    databaseExists(join(path))
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Database'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
