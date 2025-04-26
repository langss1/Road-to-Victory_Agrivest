import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SapiModel {
  final String category;
  final String categoryIcons;
  final String namaHewan;
  final int harga;
  final bool isAvailable;
  final int berat;
  final String namaPeternakan;
  final int slot;
  final String keuntungan;
  final double change;
  final String umur;

  SapiModel({
    required this.category,
    required this.categoryIcons,
    required this.namaHewan,
    required this.harga,
    required this.isAvailable,
    required this.berat,
    required this.namaPeternakan,
    required this.slot,
    required this.keuntungan,
    required this.change,
    required this.umur,
  });

  factory SapiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return SapiModel(
      category: data['category'] ?? '',
      categoryIcons: data['categoryIcons'] ?? '',
      namaHewan: data['namaHewan'] ?? '',
      harga: data['harga'] ?? 0,
      isAvailable: data['isAvailable'] ?? false,
      berat: data['berat'] ?? 0,
      namaPeternakan: data['namaPeternakan'] ?? '',
      slot: data['slot'] ?? '',
      keuntungan: data['keuntungan'] ?? '',
      change: data['change'] ?? 0.0,
      umur: data['umur']?.toString() ?? '',
    );
  }
}

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

  var allItems = <SapiModel>[].obs;
  var isLoading = true.obs;

  List<SapiModel> get filteredItems {
    if (selectedCategory.value == 'Semua') {
      return allItems.toList();
    } else {
      return allItems
          .where((item) => item.category == selectedCategory.value)
          .toList();
    }
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
    fetchItems();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      int nextPage = (currentPage.value + 1) % bannerImages.length;
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void fetchItems() async {
    if (allItems.isNotEmpty) return;
    isLoading.value = true;
    FirebaseFirestore.instance.collection('HewanTernak').snapshots().listen(
      (snapshot) {
        allItems.value =
            snapshot.docs.map((doc) => SapiModel.fromFirestore(doc)).toList();
        isLoading.value = false;
      },
    );
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
