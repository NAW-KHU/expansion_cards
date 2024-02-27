// expansion_tile_card
// import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:my_app_feburary/refactor/flutter_form.dart';
// import 'package:my_app_feburary/refactor/expansion_panel_list_radio.dart';
// import 'package:my_app_feburary/refactor/pagestoragekey.dart';
// import 'package:my_app_feburary/refactor/expansion_panel_list.dart';
// import 'package:my_app_feburary/refactor/expansion_tile_card2.dart';
import 'package:my_app_feburary/refactor/main_to_call_sql.dart';

// import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
// import 'package:sqflite_`common/sqlite_api.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  // sqflite_ffi.databaseFactory = databaseFactoryFfi;
  // Database database = await openDatabase('kindacode.db');
  // final documentsDirectory = await getDatabasesPath();
  // final dbPath = p.join(documentsDirectory, 'kindacode.db');
  // if (kDebugMode) {
  //   print('database path: $dbPath');
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
