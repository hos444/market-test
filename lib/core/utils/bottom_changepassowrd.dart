import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finall_app/core/utils/export_packeg.dart';

class Listtile extends StatelessWidget {
  const Listtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 71,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/icons/setting.svg',
            height: 24,
            width: 24,
          ),
          title: const Text('Change Password'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
            );
          },
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }
}
