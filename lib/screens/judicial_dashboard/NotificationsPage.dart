import 'package:flutter/material.dart';

class NotificationsPagejd extends StatelessWidget {
  const NotificationsPagejd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _buildNotificationCard(notification);
        },
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          notification.icon,
          color: notification.color,
          size: 40,
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          notification.message,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: Text(
          notification.time,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}

// Example Notification Data
class NotificationItem {
  final IconData icon;
  final String title;
  final String message;
  final String time;
  final Color color;

  NotificationItem({
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.color,
  });
}

// Dummy Notifications
final List<NotificationItem> notifications = [
  NotificationItem(
    icon: Icons.gavel,
    title: 'New Bail Application',
    message: 'You have 3 new bail applications to review.',
    time: '2 hrs ago',
    color: Colors.blue,
  ),
  NotificationItem(
    icon: Icons.schedule,
    title: 'Scheduled Hearing',
    message: 'A hearing is scheduled for Case #12345 tomorrow at 10:00 AM.',
    time: '5 hrs ago',
    color: Colors.green,
  ),
  NotificationItem(
    icon: Icons.warning,
    title: 'Case Pending',
    message: 'Case #54321 has been pending for over 30 days.',
    time: '1 day ago',
    color: Colors.orange,
  ),
  NotificationItem(
    icon: Icons.message,
    title: 'Message from Registrar',
    message: 'Please review the case files for Case #67890.',
    time: '2 days ago',
    color: Colors.red,
  ),
];
