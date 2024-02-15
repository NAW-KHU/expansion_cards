import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final List<Map<String, dynamic>> _items = List.generate(
      20,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. There is nothing important here.In fact, it is meaningless.',
            'isExpanded': false
          });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 3,
          animationDuration: const Duration(milliseconds: 600),
          children: _items
            .map(
              (item) => ExpansionPanelRadio(
                value: item['id'], 
                canTapOnHeader: true,
                headerBuilder:(_, isExpanded) =>
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 30
                    ),
                    child: Text(item['title'],
                    style: const TextStyle(fontSize: 20)),
                  ),
                body: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 30
                  ),
                  child: Text(
                    item['description']
                  ),
                ),
              )
          ).toList(),        
        ),
      ),
    );
  }
}