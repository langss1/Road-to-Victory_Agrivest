import 'package:agrivest/app/modules/RegisterInvestor/bindings/register_investor_binding.dart';
import 'package:agrivest/app/modules/RegisterInvestor/views/register_investor_view.dart';
import 'package:agrivest/app/modules/investasi/views/investasi_detail.dart';
import 'package:agrivest/app/modules/lainnyaHome/bindings/lainnya_home_binding.dart';
import 'package:agrivest/app/modules/lainnyaHome/views/lainnya_home_view.dart';

import 'package:agrivest/app/modules/investasi/bindings/investasi_binding.dart';
import 'package:agrivest/app/modules/investasi/views/investasi_home_view.dart';

import 'package:agrivest/app/modules/loginInvestor/bindings/login_investor_binding.dart';
import 'package:agrivest/app/modules/loginInvestor/views/login_investor_view.dart';
import 'package:agrivest/app/modules/pilihAkun/bindings/pilih_akun_binding.dart';
import 'package:agrivest/app/modules/pilihAkun/views/pilih_akun_view.dart';
import 'package:agrivest/app/modules/profile/bindings/profile_binding.dart';
import 'package:agrivest/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INVESTASI;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
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
        binding: RegisterInvestorBinding()),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LAINNYAHOME,
      page: () => LainnyaHomeView(),
      binding: LainnyaHomeBinding(),
    ),
    GetPage(
      name: _Paths.INVESTASI,
      page: () => InvestasiHomeView(),
      binding: InvestasiBinding(),
    ),
    GetPage(
      name: _Paths.INVESTASIDETAIL,
      page: () => InvestasiDetailView(),
      binding: InvestasiBinding(),
    ),
    GetPage(
      name: _Paths.REGISTERINVESTOR,
      page: () => RegisterInvestorView(),
      binding: RegisterInvestorBinding(),
    )
  ];
}
