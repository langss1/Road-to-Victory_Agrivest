import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterInvestorController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  var isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    namaController.addListener(validateForm);
    emailController.addListener(validateForm);
    numberController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  void validateForm() {
    isFormValid.value = namaController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        numberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> register() async {
    if (!isFormValid.value) {
      Get.snackbar(
        'Gagal',
        'Mohon lengkapi semua field!',
      );
      return;
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection('investor')
          .doc(userCredential.user!.uid)
          .set({
        'nama': namaController.text.trim(),
        'email': emailController.text.trim(),
        'nomor': numberController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });
      Get.snackbar(
        'Berhasil',
        'Akun berhasil didaftarkan!',
      );

      Get.offAllNamed('/login-investor');
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Terjadi kesalahan';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email sudah digunakan.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Password terlalu lemah.';
      }

      Get.snackbar(
        'Gagal',
        errorMessage,
      );
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Error: $e',
      );
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
