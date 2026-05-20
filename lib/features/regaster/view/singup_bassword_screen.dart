import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _ChooseProfileScreenState();
}

class _ChooseProfileScreenState extends State<SingUp> {
  int? selectedIndex;
  String? selectedRole;

  final List<Map<String, dynamic>> roles = [
    
    {
      'index': 2,
      'role': 'TRADER',
      'icon': Icons.storefront_rounded,
      'title': 'trader',
      'subtitle': 'trader_desc',
      'color': Color(0xff2E7D32),
    },
    {
      'index': 3,
      'role': 'COMPANY',
      'icon': Icons.business_rounded,
      'title': 'institution',
      'subtitle': 'institution_desc',
      'color': Color(0xff0D47A1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "who_are_you".tr(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff1A1A1A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "choose_account_type".tr(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.separated(
                  itemCount: roles.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    return _buildRoleCard(role);
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: selectedIndex == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SingUp2(role: selectedRole!),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: roles.firstWhere((r) => r['index'] == selectedIndex, orElse: () => roles[0])['color'],
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "continue_btn".tr(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(Map<String, dynamic> role) {
    bool isSelected = selectedIndex == role['index'];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = role['index'];
          selectedRole = role['role'];
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? role['color'] : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                ? role['color'].withOpacity(0.1)
                : Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isSelected ? role['color'] : role['color'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                role['icon'],
                color: isSelected ? Colors.white : role['color'],
                size: 28,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role['title'].toString().tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xff1A1A1A),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    role['subtitle'].toString().tr(),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle_rounded, color: role['color'], size: 24)
            else
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
