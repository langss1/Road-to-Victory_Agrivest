import 'package:get/get.dart';

enum AccountType { investor, mitra }

class PilihAkunController extends GetxController {
  var selectedAccount = Rxn<AccountType>();

  void selectAccount(AccountType type) {
    selectedAccount.value = type;
  }

  void continueToNext() {
    if (selectedAccount.value == AccountType.investor) {
      Get.toNamed('/login-investor');
    } else if (selectedAccount.value == AccountType.mitra) {
      Get.toNamed('/login-mitra');
    }
  }
}
