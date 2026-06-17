import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/theme/app_color.dart';
import 'package:finall_app/core/utils/arrow.dart';
import 'package:finall_app/core/utils/elevated_botton.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool obscureOld = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        elevation: 0,
        leading: ArrowBack(),
        centerTitle: true,
        title: Text(
          "change_password".tr(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Card Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Old Password
                  _buildLabel("old".tr()),
                  _buildPasswordField(
                    hint: "enter_old_password".tr(),
                    obscure: obscureOld,
                    onToggle: () {
                      setState(() => obscureOld = !obscureOld);
                    },
                  ),

                  const SizedBox(height: 15),

                  /// New Password
                  _buildLabel("new_password".tr()),
                  _buildPasswordField(
                    hint: "enter_new_password".tr(),
                    obscure: obscureNew,
                    onToggle: () {
                      setState(() => obscureNew = !obscureNew);
                    },
                  ),

                  const SizedBox(height: 15),

                  /// Confirm Password
                  _buildLabel("confirm_password".tr()),
                  _buildPasswordField(
                    hint: "confirm_new_password".tr(),
                    obscure: obscureConfirm,
                    onToggle: () {
                      setState(() => obscureConfirm = !obscureConfirm);
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// 🔹 Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElBotton(
                titel: "save_edits".tr(),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Label
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    );
  }

  /// 🔹 Password Field
  Widget _buildPasswordField({
    required String hint,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.green,
            ),
            onPressed: onToggle,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
