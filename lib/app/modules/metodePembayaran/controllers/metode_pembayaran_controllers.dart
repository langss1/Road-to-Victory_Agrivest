import 'package:get/get.dart';

class MetodePembayaranController extends GetxController {
  var selectedMethod = ''.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  bool get isButtonEnabled => selectedMethod.isNotEmpty;
}
