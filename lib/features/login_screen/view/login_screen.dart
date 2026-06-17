import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/core/utils/login_build.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 25),
              // logo image
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 280,
                    child: Image.asset(
                      'assets/logo/Image.png',
                      height: 220,
                      width: 220,
                    ),
                  ),
                  Positioned(
                    top: 25,
                    right: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(
                            onPressed: () {
                              final locale =
                                  context.locale.languageCode == 'en'
                                      ? const Locale('ar')
                                      : const Locale('en');
                              context.setLocale(locale);
                            },
                            icon: const Icon(
                              Icons.language,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //text botton login with facebook
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: InkWell(
                  child: SocialButton(
                    text: "signup_facebook".tr(),
                    icon: 'assets/icons/facebook.svg',
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.green,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 10),
              //text botton login with google
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: InkWell(
                  child: SocialButton(
                    text: "signup_google".tr(),
                    icon: 'assets/icons/google.svg',
                    color: Colors.white,
                    textColor: Colors.black,
                    borderColor: Colors.green,
                  ),
                  onTap: () {},
                ),
              ),

              const SizedBox(height: 20),

              /// 🔹 Divider
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("أو"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),
              //Email box
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15),
                    child: LoginBuild(
                      hint: "email".tr(),
                      icon: Icons.email_outlined,
                    ),
                  ),
                  SizedBox(height: 10),

                  SizedBox(height: 10),
                  //password box
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 15),
                    child: LoginBuild(
                      hint: "password".tr(),
                      icon: Icons.lock_outline,
                    ),
                  ),
                ],
              ),

              //text forget password
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "forget".tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              //text botton login
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
                      ),
                    );
                  },
                  child:
                      isLoading
                          ? CircularProgressIndicator(color: AppColors.accent)
                          : Text(
                            "login".tr(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                ),
              ),
              //text botton register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already_account".tr(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SingUp()),
                      );
                    },
                    child: Text(
                      'register'.tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
