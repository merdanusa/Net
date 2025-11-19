import 'package:get/get.dart';
import 'package:vpn/pages/home_page.dart';
import 'package:vpn/pages/profile_page.dart';
import 'package:vpn/pages/reset_flow_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomePage()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage()),
    GetPage(name: AppRoutes.resetFlow, page: () => ResetFlowPage()),
  ];
}
