import 'package:finall_app/core/utils/arrow.dart';
import 'package:flutter/material.dart';

class AdressScreen extends StatefulWidget {
  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AdressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        title: Text("Add your address"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🗺️ Container بديل مؤقت للخريطة
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[300],
                    child: Center(child: Text("Map Placeholder")),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {},
                      child: Text("Add your current location"),
                    ),
                  ),

                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {},
                      child: Text("save this location"),
                    ),
                  ),
                ],
              ),
            ),

            /// 📋 FORM
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle("shipping address"),
                  textField("Address name"),
                  rowFields(["Governate", "City", "District"]),
                  textField("Field Label"),
                  textField("Street Name"),
                  textField("Floor / Unit"),

                  SizedBox(height: 10),

                  sectionTitle("Receiver contact"),
                  textField("Receiver Name"),
                  textField("Mobile Number"),
                  textField("Driver Notes"),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: Text("Add this location"),
                    ),
                  ),

                  SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: Text("save this location"),
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

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }

  Widget textField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget rowFields(List<String> hints) {
    return Row(
      children:
          hints.map((hint) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: textField(hint),
              ),
            );
          }).toList(),
    );
  }
}
