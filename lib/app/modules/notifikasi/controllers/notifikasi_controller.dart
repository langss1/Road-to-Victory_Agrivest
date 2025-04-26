import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String icon;
  final String title;
  final String description;
  final DateTime dateTime;

  NotificationModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      icon: data['icon'],
      title: data['title'],
      description: data['description'],
      dateTime: (data['dateTime'] as Timestamp).toDate(),
    );
  }
}

class NotifikasiController extends GetxController {
  var todayNotifications = <NotificationModel>[].obs;
  var yesterdayNotifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('notifications')
        .orderBy('dateTime', descending: true)
        .get();

    final now = DateTime.now();
    final today = <NotificationModel>[];
    final yesterday = <NotificationModel>[];

    for (var doc in snapshot.docs) {
      final notif = NotificationModel.fromFirestore(doc);
      if (_isSameDay(notif.dateTime, now)) {
        today.add(notif);
      } else if (_isSameDay(notif.dateTime, now.subtract(Duration(days: 1)))) {
        yesterday.add(notif);
      }
    }

    todayNotifications.assignAll(today);
    yesterdayNotifications.assignAll(yesterday);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
