import 'package:agrivest/app/modules/loginInvestor/controllers/google_sign_in_investor.dart';
import 'package:agrivest/app/modules/loginInvestor/controllers/login_investor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginInvestorView extends StatelessWidget {
  final LoginInvestorController controller = Get.put(LoginInvestorController());
  final GoogleSignInController googleController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masuk',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF90BA3E),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Buat akun untuk jadi investor peternakan bersama Agrivest, dukung peternakan Indonesia semakin maju.',
                style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF252525),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Email",
                style: GoogleFonts.nunito(
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  hintText: "Masukkan email disini",
                  hintStyle: GoogleFonts.nunito(
                    textStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: GoogleFonts.nunito(
                  textStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 10),
              Obx(() => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                      hintText: 'Masukkan password disini',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isObscure.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  )),
              SizedBox(height: 40),
              Obx(() => ElevatedButton(
                    onPressed:
                        controller.isFormValid.value ? controller.login : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 56),
                      backgroundColor: controller.isFormValid.value
                          ? Color(0xFF90BA3E)
                          : Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "atau",
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(fontSize: 14),
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => googleController.signInWithGoogle(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/google.png",
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Text("Masuk dengan Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 36),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Belum Punya akun?",
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed('/register-investor'),
                      child: Text(
                        " Daftar Sekarang",
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF90BA3E),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36),
              Container(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Dengan mendaftar, Anda telah menyetujui kebijakan dan privasi dari aplikasi ',
                        ),
                        TextSpan(
                          text: 'Agrivest',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
