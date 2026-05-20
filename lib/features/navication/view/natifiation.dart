import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finall_app/core/utils/export_packeg.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../presentation/bloc/notification_cubit.dart';
import '../data/models/notification_model.dart';

class Natifiation extends StatefulWidget {
  const Natifiation({super.key});

  @override
  State<Natifiation> createState() => _NatifiationState();
}

class _NatifiationState extends State<Natifiation> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notifications".tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              context.read<NotificationCubit>().markAllAsRead();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationError) {
            return Center(child: Text(state.message));
          } else if (state is NotificationsLoaded) {
            if (state.notifications.isEmpty) {
              return _buildEmptyState();
            }
            return ListView.builder(
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                return _buildNotificationItem(notification);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.notifications_none,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "no_notifications".tr(),
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 116, 182, 37),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainScreen(initialPage: 0),
                ),
              );
            },
            child: Text("back_home".tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: notification.readAt == null ? Colors.green : Colors.grey[200],
        child: Icon(
          Icons.notifications,
          color: notification.readAt == null ? Colors.white : Colors.grey,
        ),
      ),
      title: Text(
        notification.title,
        style: TextStyle(
          fontWeight: notification.readAt == null ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(notification.message),
      trailing: Text(
        DateFormat.jm().format(notification.createdAt),
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      onTap: () {
        if (notification.readAt == null) {
          context.read<NotificationCubit>().markAsRead(notification.id);
        }
      },
    );
  }
}
