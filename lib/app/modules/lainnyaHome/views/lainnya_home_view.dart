import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../controllers/lainnya_home_controller.dart';

class LainnyaHomeView extends GetView<LainnyaHomeController> {
  const LainnyaHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Lagi Trending 🔥',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => Center(
                    child: Wrap(
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
                          selectedColor: const Color(0xFF90BA3E),
                          onSelected: (_) =>
                              controller.selectCategory(category),
                          showCheckmark: false,
                          backgroundColor: Colors.white,
                        );
                      }).toList(),
                    ),
                  )),
              const SizedBox(height: 16),
              Obx(() => Column(
                    children: controller.filteredItems.map((item) {
                      final iconPath =
                          controller.categoryIcons[item['category']] ??
                              'assets/image/default.png';
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        color: Colors.white,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: Image.asset(
                            iconPath,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          title: Text(
                            item['name'],
                            style:
                                GoogleFonts.nunito(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Peternakan Sari Bumi',
                            style: GoogleFonts.nunito(color: Colors.grey[600]),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Rp${item['price']}/kg',
                                style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "${item['change']}%",
                                style: GoogleFonts.nunito(
                                  color: item['change'] > 0
                                      ? Colors.green
                                      : (item['change'] < 0
                                          ? Colors.red
                                          : Colors.grey),
                                  fontWeight: FontWeight.w500,
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
    );
  }
}
