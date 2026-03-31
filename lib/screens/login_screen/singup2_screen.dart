import 'package:finall_app/shared/export_packeg.dart';
import 'package:flutter/material.dart';

class SingUp2 extends StatelessWidget {
  const SingUp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Container(
                    width: 240,
                    height: 248,
                    child: Image.asset('assets/logo/Image.png'),
                  ),
                ),

                // Back Button
                SizedBox(height: 10),

                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 6),

                Text(
                  "Join the largest agri-marketplace",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),

                SizedBox(height: 30),

                buildTextField(hint: "Full Name"),

                SizedBox(height: 16),

                buildTextField(hint: "Company/Farm Name"),

                SizedBox(height: 16),

                buildTextField(hint: "Email"),

                SizedBox(height: 16),

                buildTextField(hint: "Password", isPassword: true),

                SizedBox(height: 30),

                // Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 167, 103),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required String hint,
    bool isPassword = false,
    bool isFocused = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: isFocused ? const Color(0xff1B5E3C) : Colors.grey.shade300,
            width: isFocused ? 2 : 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xff1B5E3C), width: 2),
        ),
      ),
    );
  }
}
