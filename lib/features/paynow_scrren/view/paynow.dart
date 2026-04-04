
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class Paynow extends StatelessWidget {
  const Paynow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 142, 234, 150),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 60, color: Color(0xFF0B5D4B)),
              ),

              SizedBox(height: 30),

              // ✅ Title
              Text(
                "Payment Successful",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              // ✅ Subtitle
              Text(
                "Your payment has been completed successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              SizedBox(height: 40),

              // ✅ Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 30, 229, 73),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => MainScreen(
                              initialPage: 0, // 0 = Home
                            ),
                      ),
                      (route) => false, // يمسح كل اللي فوق
                    );
                  },
                  child: Text("Back to Home", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
