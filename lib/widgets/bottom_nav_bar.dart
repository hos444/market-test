import 'package:finall_app/screens/export_packeg.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  static int index = 0;
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        if (value == 0) {
          index = value;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (value == 1) {
          index = value;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Favourite()),
          );
        } else if (value == 2) {
          index = value;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else if (value == 3) {
          index = value;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserScreen()),
          );
        }
      },
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Favourite",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}
