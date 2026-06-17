import 'package:finall_app/core/utils/export_packeg.dart' show SearchScreen;
import 'package:flutter/material.dart';

class WidgetSerch extends StatefulWidget {
  const WidgetSerch({super.key});

  @override
  State<WidgetSerch> createState() => _MarketTabsSearchState();
}

class _MarketTabsSearchState extends State<WidgetSerch> {
  int selectedTab = 0;

  final List<String> tabs = ["Spot Market", "Future Contracts", "Auctions"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search for crops, farms or regions...",
            border: InputBorder.none,
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
