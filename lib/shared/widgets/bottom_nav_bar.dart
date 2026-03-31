import 'package:finall_app/screens/cart_screen.dart';
import 'package:finall_app/screens/favourite_screen.dart';
import 'package:finall_app/screens/profile_screen/myOrder.dart';
import 'package:finall_app/screens/profile_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../export_packeg.dart' show Checkout, HomePage;

class MainScreen extends StatefulWidget {
  final int initialPage; // ✨

  const MainScreen({Key? key, this.initialPage = 0}) : super(key: key); // ✨

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _page;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage; // ✨
  }

  final List<Widget> _screens = [
    HomePage(),
    Favourite(),
    CartScreen(),
    Myorder(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _page, children: _screens),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.green,
        color: Colors.green,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, color: Colors.white, size: 24),
          Icon(Icons.favorite, color: Colors.white, size: 24),
          Icon(Icons.shopping_cart, color: Colors.white, size: 24),
          Icon(Icons.list_alt, color: Colors.white, size: 24),
          Icon(Icons.person, color: Colors.white, size: 24),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
