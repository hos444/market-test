import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double startPrice = 0;
  double endPrice = 20000;

  int selectedRating = 0;

  List<String> categories = [
    "All",
    "Vegetables",
    "Fruits",
    "Citrus",
    "Nuts",
    "Herbs",
    "Grains",
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text(
          "Filter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Categories mark
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            // Categories
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          selectedCategory == index
                              ? Colors.green
                              : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color:
                            selectedCategory == index
                                ? Colors.white
                                : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 30),
            // Price Range
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Price Range",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            // Range Slider
            RangeSlider(
              values: RangeValues(startPrice, endPrice),
              min: 0,
              max: 20000,
              divisions: 20,
              activeColor: Colors.green,
              labels: RangeLabels(
                startPrice.toStringAsFixed(0),
                endPrice.toStringAsFixed(0),
              ),
              onChanged: (values) {
                setState(() {
                  startPrice = values.start;
                  endPrice = values.end;
                });
              },
            ),
            // Price Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${startPrice.toInt()}"),
                Text("\$${endPrice.toInt()}"),
              ],
            ),

            SizedBox(height: 30),

            // Rating
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Rating",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   selectedRating = index + 1;
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Text("${index + 1}", style: TextStyle(fontSize: 18)),
                          SizedBox(width: 6),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            Spacer(),
            // Button apply now
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                child: const Text(
                  "apply now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
