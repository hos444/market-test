import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class AddNewCredit extends StatelessWidget {
  const AddNewCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Circle
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 600),
              tween: Tween(begin: 0.5, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: Color(0xFF81C784),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.credit_card,
                  size: 45,
                  color: Color(0xFF1B5E20),
                ),
              ),
            ),

            SizedBox(height: 25),

            Text(
              "You didn’t add any card yet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF66BB6A),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 14),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => AddCardScreen(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
              child: Text("Add Card"),
            ),
          ],
        ),
      ),
    );
  }
}
