import 'package:finall_app/screens/filter_screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.tune),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterScreen()),
                );
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //icon need to link to search function
            TextField(
              decoration: InputDecoration(
                hintText: "Search.....",
                border: InputBorder.none,
                icon: IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear All',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
