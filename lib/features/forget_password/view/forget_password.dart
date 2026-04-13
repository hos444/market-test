import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void sendResetLink() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    /// simulate API
    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    /// navigate to OTP screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const VerifyEmailScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                /// Title
                 Text(
                  "forgot_password".tr(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                /// Subtitle
                 Text(
                  "enter_email_desc".tr(),
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 40),

                /// Email Field (Styled زي OTP)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.primary, width: 1.5),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      hintText: "email_hint".tr(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 18,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppColors.primary,
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "email_required".tr();
                      }

                      if (!value.contains("@") || !value.contains(".")) {
                        return "email_invalid".tr();
                      }

                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 40),

                /// Button (زي OTP)
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.accent],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: MaterialButton(
                    onPressed: isLoading ? null : sendResetLink,
                    child:
                        isLoading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : Text(
                              "send_code".tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
