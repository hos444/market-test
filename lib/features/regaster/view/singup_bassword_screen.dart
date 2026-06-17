import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _ChooseProfileScreenState();
}

class _ChooseProfileScreenState extends State<SingUp> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),

              const SizedBox(height: 20),
              Text(
                "who".tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                "choose".tr(),
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              SizedBox(height: 30),

              SizedBox(height: 16),

              SingUpItem(
                index: 1,
                icon: Icons.store,
                title: "marchant".tr(),
                subtitle: "march".tr(),
              ),

              SizedBox(height: 16),

              SingUpItem(
                index: 2,
                icon: Icons.local_shipping,
                title: "crop".tr(),
                subtitle: "croop".tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget SingUpItem({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingUp2()),
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xff1B5E3C) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF1B5E3C) : Color(0xffE8F3EE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : Color(0xff1B5E3C),
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
