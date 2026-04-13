import 'package:easy_localization/easy_localization.dart';
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
        title: Text("titlea".tr()),
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
                    child: Center(child: Text("map_placeholder".tr())),
                  ),

                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {},
                      child: Text("add_current_location".tr()),
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
                      child: Text("save_location".tr()),
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
                  sectionTitle("shipping_address".tr()),
                  textField("address_name".tr()),
                  rowFields(["governorate".tr(), "city".tr(), "district".tr()]),
                  textField("field_label".tr()),
                  textField("street_name".tr()),

                  // textField("floor_unit".tr()),
                  SizedBox(height: 10),

                  sectionTitle("receiver_contact".tr()),
                  textField("receiver_name".tr()),
                  textField("mobile_number".tr()),
                  textField("driver_notes".tr()),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: Text("add_location".tr()),
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
                      child: Text("save_location".tr()),
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
