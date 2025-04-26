import 'package:get/get.dart';

class Investment {
  final String age;
  final String type;
  final double value;
  final double profit;

  Investment(
      {required this.age,
      required this.type,
      required this.value,
      required this.profit});
}

class PortofolioController extends GetxController {
  var totalValue = 0.0.obs;
  var totalProfit = 0.0.obs;
  var totalSlot = 0.obs;
  var investments = <Investment>[].obs;
  var isObscured = true.obs;

  void toggleObscure() {
    isObscured.value = !isObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
    fetchInvestments();
  }

  void fetchInvestments() {
    var data = [
      Investment(
          age: "Umur 1 Bulan",
          type: "Sapi Limosin",
          value: 250000,
          profit: 5000),
      Investment(
          age: "Umur 2 Bulan",
          type: "Sapi Limosin",
          value: 250000,
          profit: 5000),
    ];
    investments.value = data;
    totalValue.value = data.fold(0, (sum, item) => sum + item.value);
    totalProfit.value = data.fold(0, (sum, item) => sum + item.profit);
    totalSlot.value = data.length;
  }
}
