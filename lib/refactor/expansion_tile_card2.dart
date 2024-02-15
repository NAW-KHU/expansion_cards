import 'package:flutter/material.dart';
import 'package:my_app_feburary/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Generate a list of list items
  // In real app, data often is fetched from an API or a database
  final List<Map<String, dynamic>> _items = List.generate(
      50,
      (index) => {
            "id": index,
            "title": "Item $index",
            "content":
                "This is main content of item $index. It is very long and you have to expand the title to see it."
          });
  //This function is called when a "Remove" button associated with an item is pressed.
  void _removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item with id #$id has been removed'),
        duration: const Duration(milliseconds: 600),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KindaCode.com'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {// "_"underscore indicate that a parameter is not used
          final item = _items[index];
          return Card(
            // this key is required to save and restore ExpansionTile expanded state
            key: PageStorageKey(item['id']), //close this syntax and check what is going to change in the card.
            color: Colors.amber.shade200,
            elevation: 4.0,
            child: ExpansionTile(
              title: Text(item['title']),
              controlAffinity: ListTileControlAffinity.leading,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: true,
              //contents
              children: [
                Text(item['content']),
                // This button is used to remove this item
                TextButton.icon(
                    onPressed: () => _removeItem(item['id']), 
                    icon: const Icon(Icons.delete),
                    label: const Text('Remove'),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
