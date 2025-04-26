import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isObscured = true.obs;
  var selectedCategory = 'Semua'.obs;

  void toggleObscure() {
    isObscured.value = !isObscured.value;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  final Map<String, String> categoryIcons = {
    'Sapi': 'assets/images/cow.png',
    'Domba': 'assets/images/domba.png',
    'Kambing': 'assets/images/kambing.png',
  };

  List<Map<String, dynamic>> allItems = [
    {
      'name': 'Sapi Limosin',
      'price': 35000,
      'change': -0.1,
      'category': 'Sapi'
    },
    {
      'name': 'Sapi Limosin',
      'price': 55000,
      'change': -0.2,
      'category': 'Sapi'
    },
    {'name': 'Sapi Limosin', 'price': 55000, 'change': 0.0, 'category': 'Sapi'},
    {
      'name': 'Kambing Etawa',
      'price': 40000,
      'change': 0.05,
      'category': 'Kambing'
    },
    {
      'name': 'Kambing Etawa',
      'price': 41000,
      'change': 0.3,
      'category': 'Kambing'
    },
    {
      'name': 'Kambing Etawa',
      'price': 39000,
      'change': -0.02,
      'category': 'Kambing'
    },
    {
      'name': 'Domba Garut',
      'price': 30000,
      'change': 0.07,
      'category': 'Domba'
    },
    {'name': 'Domba Garut', 'price': 31000, 'change': 0.6, 'category': 'Domba'},
    {
      'name': 'Domba Garut',
      'price': 29500,
      'change': -0.4,
      'category': 'Domba'
    },
  ];

  List<Map<String, dynamic>> get filteredItems {
    if (selectedCategory.value == 'Semua') {
      final categories = ['Sapi', 'Kambing', 'Domba'];
      List<Map<String, dynamic>> result = [];

      for (var category in categories) {
        final item = allItems.firstWhere(
          (element) => element['category'] == category,
          orElse: () => {},
        );
        if (item.isNotEmpty) {
          result.add(item);
        }
      }

      return result;
    }

    return allItems
        .where((item) => item['category'] == selectedCategory.value)
        .toList();
  }

  final pageController = PageController();
  var currentPage = 0.obs;
  Timer? timer;

  final bannerImages = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      int nextPage = (currentPage.value + 1) % bannerImages.length;
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
