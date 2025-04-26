import 'package:get/get.dart';

class NotifikasiController extends GetxController {
  var todayNotifications = <NotificationModel>[
    NotificationModel(
      icon: 'assets/images/idea.png',
      title: 'Judul Notifikasi',
      description: 'deskripsi notifikasi akan seperti apa',
      dateTime: '12 Maret 2025, 08:09 WIB',
    ),
  ].obs;

  var yesterdayNotifications = <NotificationModel>[
    NotificationModel(
      icon: 'assets/images/cloud.png',
      title: 'Judul Notifikasi',
      description: 'deskripsi notifikasi akan seperti apa',
      dateTime: '11 Maret 2025, 08:00 WIB',
    ),
  ].obs;
}

class NotificationModel {
  final String icon;
  final String title;
  final String description;
  final String dateTime;

  NotificationModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.dateTime,
  });
}
