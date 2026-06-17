import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBack(),
        centerTitle: true,
        title: Text(
          "settings".tr(),
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
                  title: Text(
                    "change_password".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangePasswordScreen(),
                      ),
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
                  title: Text(
                    "privacy_policy".tr(),
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
                  title: Text(
                    "about_us".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsScreen()),
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
                  leading: Icon(Icons.language, color: Colors.green),
                  title: Text(
                    "change_language".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    final locale =
                        context.locale.languageCode == 'en'
                            ? const Locale('ar')
                            : const Locale('en');
                    context.setLocale(locale);
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
                  title: Text(
                    "delete_account".tr(),
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
