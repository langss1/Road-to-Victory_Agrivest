import 'package:agrivest/app/common/customnavbar/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'agrivest',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF90BA3E),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_none,
                            size: 28, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nilai Portofolio',
                            style: GoogleFonts.nunito(color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text(
                                controller.isObscured.value
                                    ? 'Rp ****'
                                    : 'Rp 0',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: controller.toggleObscure,
                                child: Icon(
                                  controller.isObscured.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Keuntungan',
                                      style: GoogleFonts.nunito(
                                          color: Colors.grey)),
                                  SizedBox(height: 4),
                                  Text('Rp0',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Persentase',
                                      style: GoogleFonts.nunito(
                                          color: Colors.grey)),
                                  SizedBox(height: 4),
                                  Text('0.00%',
                                      style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: controller.bannerImages.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          controller.bannerImages[index],
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.bannerImages.length,
                          (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? Colors.green
                                : Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    )),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuItem('assets/images/investasi.png', 'Investasi',
                        Color(0xFFF0EEE8), '/investasi', context),
                    _buildMenuItem('assets/images/saham.png', 'Saham',
                        Color(0xFFF1F4E6), '/saham', context),
                    _buildMenuItem('assets/images/komunitas.png', 'Komunitas',
                        Color(0xFFE7F1FF), '/komunitas', context),
                    _buildMenuItem(
                        'assets/images/trend_pasar.png',
                        'Tren Pasar',
                        Color(0xFFF1E6FF),
                        '/tren-pasar',
                        context),
                  ],
                ),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lagi Trending',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/lainnya-home');
                      },
                      child: Text(
                        'Selengakpnya',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Obx(() => Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children:
                          ['Semua', 'Sapi', 'Domba', 'Kambing'].map((category) {
                        final isSelected =
                            controller.selectedCategory.value == category;
                        return ChoiceChip(
                          label: Text(
                            category,
                            style: GoogleFonts.nunito(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: Color(0xFF90BA3E),
                          onSelected: (_) =>
                              controller.selectCategory(category),
                          showCheckmark: false,
                          backgroundColor: Colors.white,
                        );
                      }).toList(),
                    )),
                const SizedBox(height: 16),
                Obx(() => Column(
                      children: controller.filteredItems.map((item) {
                        final iconPath =
                            controller.categoryIcons[item['category']] ??
                                'assets/images/default.png';
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image.asset(
                              iconPath,
                              width: 40,
                              height: 40,
                            ),
                            title: Text(item['name']),
                            subtitle: Text('Peternakan Sari Bumi'),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Rp${item['price']}/kg'),
                                Text(
                                  "${item['change']}%",
                                  style: TextStyle(
                                    color: item['change'] > 0
                                        ? Colors.green
                                        : (item['change'] < 0
                                            ? Colors.red
                                            : Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}

Widget _buildMenuItem(String imagePath, String label, Color bgColor,
    String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
