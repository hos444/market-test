import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const ArrowBack(),
        title: Text(
          "privacy_policy".tr(),
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -------- SECTION 1 ----------
            PolicySectionOfPrivacy(
              title: "privacy_agreement".tr(),
              content: "privacy_agreement_desc".tr(),
            ),

            const SizedBox(height: 24),

            /// -------- SECTION 2 ----------
            PolicySectionOfPrivacy(
              title: "terms_of_service".tr(),
              content: "terms_of_service_desc".tr(),
            ),

            const SizedBox(height: 24),

            /// -------- SECTION 3 ----------
            PolicySectionOfPrivacy(
              title: "condition_of_use".tr(),
              content: "condition_of_use_desc".tr(),
            ),
          ],
        ),
      ),
    );
  }
}

/// reusable section widget
class PolicySectionOfPrivacy extends StatelessWidget {
  final String title;
  final String content;

  const PolicySectionOfPrivacy({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
