import 'package:finall_app/core/theme/app_color.dart';
import 'package:finall_app/core/utils/arrow.dart';
import 'package:finall_app/core/utils/elevated_botton.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffold,
        leading: ArrowBack(),
        centerTitle: true,
        title: const Text(
          "Edit profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Circle
            const CircleAvatar(radius: 45, backgroundColor: Colors.grey),

            const SizedBox(height: 30),

            // Username
            _buildLabel("UserName"),
            _buildTextField("username"),

            const SizedBox(height: 15),

            // Email
            _buildLabel("Email Address"),
            _buildTextField(".....@gmail.com"),

            const SizedBox(height: 15),

            // Phone
            _buildLabel("phone number"),
            _buildTextField("01..........."),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedBotton(titel: 'Save Edits'),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Label Widget
  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.black54),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField(String hint) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
