import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profile')),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
