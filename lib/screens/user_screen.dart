import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profile')),
      bottomNavigationBar: BottomNavBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            // card of account info
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
        ],
      ),
    );
  }
}
