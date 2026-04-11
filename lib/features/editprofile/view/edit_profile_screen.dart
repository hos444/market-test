import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/theme/app_color.dart';
import 'package:finall_app/core/theme/text.dart';
import 'package:finall_app/core/utils/arrow.dart';
import 'package:finall_app/core/utils/elevated_botton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    //   if (pickedFile != null) {
    //     // setState(() {
    //     //   image = File(pickedFile.path);
    //     // });
    //   }
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffold,
        leading: ArrowBack(),
        centerTitle: true,
        title: Text(
          "edit_profile".tr(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            /// 🔹 Header
            _buildProfileHeader(),

            const SizedBox(height: 30),

            /// 🔹 Username
            _buildLabel("username".tr()),
            _buildTextField("username_hint".tr()),

            const SizedBox(height: 15),

            /// 🔹 Email
            _buildLabel("email_address".tr()),
            _buildTextField("email_hint".tr()),

            const SizedBox(height: 15),

            /// 🔹 Phone
            _buildLabel("phone_number".tr()),
            _buildTextField("phone_hint".tr()),

            const SizedBox(height: 20),

            /// 🔹 Upload Image
            _buildLabel("upload_image".tr()),
            _buildUploadField(),

            const Spacer(),

            /// 🔹 Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedBotton(titel: "save_edits".tr()),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// 🔥 Header Widget
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: pickImage,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              backgroundImage: image != null ? FileImage(image!) : null,
              child:
                  image == null
                      ? const Icon(Icons.camera_alt, color: Colors.grey)
                      : null,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "username".tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "email_address".tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Label
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTextStyles.heading,
      selectionColor: AppColors.primary,
    );
  }

  /// 🔹 TextField
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

  /// 🔹 Upload Field
  Widget _buildUploadField() {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            const Icon(Icons.upload_file, color: Colors.green),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                image == null ? "choose_image".tr() : "image_selected".tr(),
                style: const TextStyle(color: Colors.black54),
              ),
            ),

            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
