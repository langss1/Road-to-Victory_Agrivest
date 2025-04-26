import 'package:agrivest/app/modules/RegisterInvestor/controllers/register_investor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInvestorView extends StatelessWidget {
  final RegisterInvestorController controller =
      Get.put(RegisterInvestorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Sebagai Investor',
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
                  "Nama Lengkap",
                  style: GoogleFonts.nunito(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controller.namaController,
                  decoration: InputDecoration(
                    hintText: "Masukkan nama lengkap disini",
                    hintStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide:
                          BorderSide(color: Color(0xFF90BA3E), width: 2),
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
                      borderSide:
                          BorderSide(color: Color(0xFF90BA3E), width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Nomor Telepon",
                  style: GoogleFonts.nunito(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: controller.numberController,
                  decoration: InputDecoration(
                    hintText: "Masukkan nomor telepon disini",
                    hintStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide:
                          BorderSide(color: Color(0xFF90BA3E), width: 2),
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
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isObscure.value,
                  decoration: InputDecoration(
                    hintText: 'Masukkan password disini',
                    hintStyle: GoogleFonts.nunito(
                      textStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
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
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed:
                      controller.isFormValid.value ? controller.register : null,
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
                    'Daftar Sekarang',
                    style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                        onTap: () => Get.toNamed('/login-investor'),
                        child: Text(
                          " Masuk Disini",
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
            );
          }),
        ),
      ),
    );
  }
}
