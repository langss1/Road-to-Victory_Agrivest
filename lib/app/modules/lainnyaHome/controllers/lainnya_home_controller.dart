import 'package:get/get.dart';

class LainnyaHomeController extends GetxController {
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
    {'name': 'Sapi Limosin', 'price': 35000, 'change': -10, 'category': 'Sapi'},
    {'name': 'Sapi Limosin', 'price': 55000, 'change': 20, 'category': 'Sapi'},
    {'name': 'Sapi Limosin', 'price': 55000, 'change': 0, 'category': 'Sapi'},
    {
      'name': 'Kambing Etawa',
      'price': 40000,
      'change': 5,
      'category': 'Kambing'
    },
    {
      'name': 'Kambing Etawa',
      'price': 41000,
      'change': 3,
      'category': 'Kambing'
    },
    {
      'name': 'Kambing Etawa',
      'price': 39000,
      'change': -2,
      'category': 'Kambing'
    },
    {'name': 'Domba Garut', 'price': 30000, 'change': 7, 'category': 'Domba'},
    {'name': 'Domba Garut', 'price': 31000, 'change': 6, 'category': 'Domba'},
    {'name': 'Domba Garut', 'price': 29500, 'change': -4, 'category': 'Domba'},
  ];

  List<Map<String, dynamic>> get filteredItems {
    if (selectedCategory.value == 'Semua') {
      return allItems;
    }

    return allItems
        .where((item) => item['category'] == selectedCategory.value)
        .toList();
  }
}
