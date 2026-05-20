import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaynowComplite extends StatelessWidget {
  final String? orderId;
  const PaynowComplite({super.key, this.orderId});

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

              Text(
                "orderSuccess.message".tr(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),

              if (orderId != null) ...[
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "order_number".tr(),
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        orderId!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],

              SizedBox(height: 40),

              // ✅ Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElBotton(
                  titel: "back_to_home".tr(),
                  onPressed: () {
                    context.read<CartController>().clearCart();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen(initialPage: 0)),
                      (route) => false,
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
