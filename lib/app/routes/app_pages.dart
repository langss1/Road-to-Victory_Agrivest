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
  ];
}
