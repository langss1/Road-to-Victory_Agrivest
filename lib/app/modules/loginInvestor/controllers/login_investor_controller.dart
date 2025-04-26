import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum AccountType { investor }

class LoginInvestorController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isObscure = true.obs;
  final isFormValid = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  void validateForm() {
    isFormValid.value =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      box.write('isLoggedIn', true);
      box.write('userEmail', email);

      Get.snackbar("Berhasil", "Login berhasil!",
          snackPosition: SnackPosition.TOP);
      Get.offAllNamed('/home');
    } on FirebaseAuthException catch (e) {
      String message = "Terjadi kesalahan";
      if (e.code == 'user-not-found') {
        message = "Email tidak ditemukan";
      } else if (e.code == 'wrong-password') {
        message = "Password salah";
      }
      Get.snackbar("Gagal", message, snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.snackbar("Gagal", "Terjadi error: $e",
          snackPosition: SnackPosition.TOP);
    }
  }
}
