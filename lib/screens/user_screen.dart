import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profile')),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // card of account info
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    //image prodect
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 12,
                        bottom: 12,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        child: Image.asset(
                          'assets/logo/Image.png',
                          height: 88,
                          width: 88,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name prodect
                        Text(
                          'account name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),

                        //price
                        Text(
                          'Member since (the year) / account type',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            /// 🔹 My Orders
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Orders",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0CA201),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("see more ..."),
                      ),
                    ],
                  ),
                  const Divider(),

                  /// 👇 الحالة الفاضية
                  Column(
                    children: const [
                      SizedBox(height: 20),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 50,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "No orders yet",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Start shopping to place your first order",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  /// Title
                  const Text(
                    "settings",
                    style: TextStyle(
                      color: Color(0xff1B5E20),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Divider(height: 1, thickness: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
