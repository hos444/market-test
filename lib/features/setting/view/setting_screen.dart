import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const ArrowBack(),
        centerTitle: true,
        title: Text(
          "settings".tr(),
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            _buildSectionTitle(context, "account".tr()),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildSettingsItem(
                  context,
                  icon: Iconsax.lock_1,
                  iconColor: const Color(0xFF2E7D32),
                  iconBgColor: const Color(0xFFE8F5E9),
                  title: "change_password".tr(),
                  subtitle: "update_password_desc".tr(),
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordScreen(),
                        ),
                      ),
                ),
                _buildDivider(),
                _buildSettingsItem(
                  context,
                  icon: Iconsax.language_circle,  
                  iconColor: const Color(0xFF1976D2),
                  iconBgColor: const Color(0xFFE3F2FD),
                  title: "change_language".tr(),
                  subtitle:
                      context.locale.languageCode == 'en'
                          ? "English"
                          : "العربية",
                  showLanguageIndicator: true,
                  onTap: () {
                    final locale =
                        context.locale.languageCode == 'en'
                            ? const Locale('ar')
                            : const Locale('en');
                    context.setLocale(locale);
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Legal & Support Section
            _buildSectionTitle(context, "legal_support".tr()),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildSettingsItem(
                  context,
                  icon: Iconsax.shield_tick,
                  iconColor: const Color(0xFF7B1FA2),
                  iconBgColor: const Color(0xFFF3E5F5),
                  title: "privacy_policy".tr(),
                  subtitle: "privacy_policy_desc".tr(),
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyScreen(),
                        ),
                      ),
                ),
                _buildDivider(),
                _buildSettingsItem(
                  context,
                  icon: Iconsax.info_circle,
                  iconColor: const Color(0xFFF57C00),
                  iconBgColor: const Color(0xFFFFF3E0),
                  title: "about_us".tr(),
                  subtitle: "app_info_desc".tr(),
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutusScreen(),
                        ),
                      ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Danger Zone Section
            _buildSectionTitle(
              context,
              "danger_zone".tr(),
              isDanger: true,
            ),
            const SizedBox(height: 12),
            _buildSettingsCard(
              isDanger: true,
              children: [
                _buildSettingsItem(
                  context,
                  icon: Iconsax.trash,
                  iconColor: const Color(0xFFD32F2F),
                  iconBgColor: const Color(0xFFFFEBEE),
                  title: "delete_account".tr(),
                  subtitle: "delete_account_desc".tr(),
                  isDanger: true,
                  onTap: () => showDeleteAccountSheet(context),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // App Version
            Center(
              child: Text(
                "Washelafas v1.0.0",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title, {
    bool isDanger = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDanger ? const Color(0xFFD32F2F) : const Color(0xFF64748B),
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required List<Widget> children,
    bool isDanger = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            isDanger
                ? Border.all(color: const Color(0xFFFFEBEE), width: 1)
                : null,
        boxShadow: [
          BoxShadow(
            color:
                isDanger
                    ? const Color(0xFFFFEBEE).withOpacity(0.5)
                    : Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    bool showLanguageIndicator = false,
    bool isDanger = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),

            // Title & Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          isDanger
                              ? const Color(0xFFD32F2F)
                              : const Color(0xFF1E293B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Language Indicator or Arrow
            if (showLanguageIndicator)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  context.locale.languageCode.toUpperCase(),
                  style: const TextStyle(
                    color: Color(0xFF1976D2),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            else
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color:
                    isDanger ? const Color(0xFFEF9A9A) : Colors.grey.shade400,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 80,
    );
  }
}
