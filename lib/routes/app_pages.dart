import 'package:get/get.dart';

import '../features/point/presentation/pages/home_page.dart';
import '../features/point/presentation/pages/login_page.dart';
import '../features/point/presentation/pages/splash_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage()),
  ];
}