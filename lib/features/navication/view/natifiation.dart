import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:finall_app/features/navication/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Natifiation extends StatefulWidget {
  const Natifiation({super.key});

  @override
  State<Natifiation> createState() => _NatifiationState();
}

class _NatifiationState extends State<Natifiation> {
  List<String> notifications = [
    "Order confirmed",
    "New offer available",
    "Your item shipped",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications".tr()),
        leading: ArrowBack(),
        centerTitle: true,
      ),
      body:
          notifications.isEmpty
              ? const EmptyNotificationsState()
              :_buildNotificationsList(),
    );
  }

  
  
  // if there are notifications, show this list
  Widget _buildNotificationsList() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.notifications, color: Colors.white),
            ),
            title: Text(
              notifications[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("just_now".tr()),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // ممكن تفتح تفاصيل الإشعار هنا
            },
          ),
        );
      },
    );
  }
}
