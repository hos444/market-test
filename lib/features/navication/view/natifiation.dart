import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class Natifiation extends StatelessWidget {
  const Natifiation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => MainScreen(initialPage: 0),
              ), // 0 = Home
              (route) => false, // يمسح كل اللي فوق
            );
          },
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.notifications_none,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Notifications Yet',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 116, 182, 37),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MainScreen(initialPage: 0), // 2 = Cart
                    ),
                  );
                },
                child: const Text("Go to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
