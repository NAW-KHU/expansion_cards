import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generating some dummy data
  final List<Map<String, dynamic>> _items = List.generate(
      20,
      (index) => {
            'id': index,
            'title': 'Item $index',
            'description':
                'This is the description of the item $index. There is nothing important here. In fact, it is meaningless.',
            'isExpanded': false,
          });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade200,
        title: const Text('Kindacode.com'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          
          elevation: 3,
          //Controlling the expansion behaviour
          expansionCallback: (index, isExpanded) {
            setState(() {
              _items[index]['isExpanded'] = isExpanded; // important
            });
          },
          animationDuration: const Duration(milliseconds: 600),
          children: _items                //do not use []
                  .map(
                    (item) => ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor: item['isExpanded'] == true
                          ? Colors.amber
                          : Colors.white,
                      headerBuilder: (_, isExpanded) => Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        child: Text(item['title'],
                            style: const TextStyle(fontSize: 20)
                        )),
                      body: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: Text(item['description']),
                      ),
                      isExpanded: item['isExpanded'],
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
