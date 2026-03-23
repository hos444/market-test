import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ChooseProfileScreenState();
}

class _ChooseProfileScreenState extends State<ForgetPassword> {
  int selectedIndex = 1;

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
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 20),
              const Text(
                "Who are you?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              Text(
                "Choose your profile type.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              SizedBox(height: 30),

              buildOption(
                index: 0,
                icon: Icons.agriculture,
                title: "I am a Farmer",
                subtitle: "Sell produce & manage harvest",
              ),

              SizedBox(height: 16),

              buildOption(
                index: 1,
                icon: Icons.store,
                title: "I am a Merchant",
                subtitle: "Buy bulk for retail/wholesale",
              ),

              SizedBox(height: 16),

              buildOption(
                index: 2,
                icon: Icons.local_shipping,
                title: "Logistics / Corp",
                subtitle: "Fleet & supply chain",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOption({
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
