// expansion_tile_card
import 'package:flutter/material.dart';
// import 'package:my_app_feburary/refactor/simple_tile_card2.dart';
// import 'package:expansion_tile_card/expansion_tile_card.dart';
// import 'my_app_scripts/refactor/expansion_tile_card1.dart';
import 'package:my_app_feburary/refactor/expansion_tile_card2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
