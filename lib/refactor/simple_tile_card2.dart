import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: const ExpansionTile(
        title: Text('Colors'),
        subtitle:Text('Expand this tile to see its contents.'),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
            ),
            title: Text('Blue'),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red),
            title: Text('Red'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text('Amber'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green),
              title: Text('Green'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
            ),
            title: Text('Yellow'),
          ),
          ListTile(
            leading: CircleAvatar(backgroundColor: Colors.pink),
            title: Text('Pink'),
          )
        ],
      ),
    );
  }
}
