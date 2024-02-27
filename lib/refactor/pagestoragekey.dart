import 'package:flutter/material.dart';

class TabViewDemo extends StatelessWidget {
  const TabViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KindaCode.com'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.settings)),
            ]
          ),
          backgroundColor: Colors.indigo.shade200,
        ),
      body: TabBarView(
        children: [
          ListView.builder(
            key: const PageStorageKey('home'),
            itemCount: 100,
            itemBuilder: (context, index) => ListTile(
              title: Text('Home item $index'),
            ),
          ),
          ListView.builder(
            key: const PageStorageKey('star'),
            itemCount: 100,
            itemBuilder: (context, index) => ListTile(
              title: Text('Star item $index'),
            ),
          ),
          ListView.builder(
            key: const PageStorageKey('settings'),
            itemCount: 100,
            itemBuilder:(context, index) => ListTile(
              title: Text('Settings item $index'),
            ),
          )
        ]
      ),
      ),
    );
  }
}
