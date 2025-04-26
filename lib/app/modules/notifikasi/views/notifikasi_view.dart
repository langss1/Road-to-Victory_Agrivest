import 'package:agrivest/app/modules/notifikasi/controllers/notifikasi_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiView extends StatelessWidget {
  final NotifikasiController controller = Get.put(NotifikasiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifikasi',
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Hari Ini'),
              const SizedBox(height: 10),
              Obx(() => Column(
                    children: controller.todayNotifications
                        .map((notif) => _notificationCard(notif))
                        .toList(),
                  )),
              const SizedBox(height: 20),
              _sectionTitle('Kemarin'),
              const SizedBox(height: 10),
              Obx(() => Column(
                    children: controller.yesterdayNotifications
                        .map((notif) => _notificationCard(notif))
                        .toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.nunito(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _notificationCard(NotificationModel notif) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            notif.icon,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif.title,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notif.description,
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  notif.dateTime,
                  style: GoogleFonts.nunito(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
