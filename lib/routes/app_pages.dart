import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:poly_manage_systm/features/main_screen/view/main_screen.dart';

import 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages() =>[
    GetPage(name: AppRoutes.dashboard, page: ()=> MainScreen()),

  ];
}