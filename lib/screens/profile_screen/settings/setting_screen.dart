import 'package:finall_app/shared/widgets/arrow.dart';
import 'package:finall_app/shared/widgets/profile_widgets/botton_cheet.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'aboutUs_screen.dart';
import 'changepassword_screen.dart';
import 'privacy_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 358,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey,
                  //   spreadRadius: 2,
                  //   blurRadius: 5,
                  //   offset: Offset(0, 3), // changes position of shadow
                  // ),
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Iconsax.lock, color: Colors.green),
                  title: const Text(
                    'Change Password',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 358,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.green),
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyScreen()),
                    );
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 358,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.green),
                  title: const Text(
                    'About Us',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutusScreen()),
                    );
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 358,
              height: 71,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
              child: Center(
                child: ListTile(
                  leading: Icon(Icons.delete_outline, color: Colors.red),
                  title: const Text(
                    'Delete Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    showDeleteAccountSheet(context);
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
