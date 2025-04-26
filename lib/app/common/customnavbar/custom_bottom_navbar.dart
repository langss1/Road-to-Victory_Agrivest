import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<String> imagePath = [
    "assets/images/home_nv.png",
    "assets/images/diagram_nv.png",
    "assets/images/riwayat_nv.png",
    "assets/images/user_nv.png"
  ];

  final List<String> labels = ['Beranda', 'Portofolio', 'Riwayat', 'Profil'];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Colors.white,
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 12),
            unselectedLabelStyle: TextStyle(fontSize: 12),
            items: List.generate(4, (index) {
              return BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.asset(
                    imagePath[index],
                    width: 24,
                    height: 24,
                  ),
                ),
                label: labels[index],
              );
            }),
          ),
        ));
  }
}
