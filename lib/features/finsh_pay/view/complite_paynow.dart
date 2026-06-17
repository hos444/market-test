import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class PaynowComplite extends StatelessWidget {
  const PaynowComplite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 142, 234, 150),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 60, color: Color(0xFF0B5D4B)),
              ),

              SizedBox(height: 30),

              // ✅ Title
              Text(
                "orderSuccess.title".tr(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),

              SizedBox(height: 10),

              // ✅ Subtitle
              Text(
                "orderSuccess.message".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),

              SizedBox(height: 40),

              // ✅ Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElBotton(
                  titel: "back_to_home".tr(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainScreen(initialPage: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
