import 'package:agrivest/app/modules/RegisterInvestor/views/register_investor_view.dart';
import 'package:agrivest/app/modules/loginInvestor/bindings/login_investor_binding.dart';
import 'package:agrivest/app/modules/loginInvestor/views/login_investor_view.dart';
import 'package:agrivest/app/modules/pilihAkun/bindings/pilih_akun_binding.dart';
import 'package:agrivest/app/modules/pilihAkun/views/pilih_akun_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PILIHAKUN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PILIHAKUN,
      page: () => PilihAkunView(),
      binding: PilihAkunBinding(),
    ),
    GetPage(
      name: _Paths.LOGININVESTOR,
      page: () => LoginInvestorView(),
      binding: LoginInvestorBinding(),
    ),
    GetPage(
      name: _Paths.REGISTERINVESTOR,
      page: () => RegisterInvestorView(),
    )
  ];
}
