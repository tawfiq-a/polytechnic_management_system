import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/main_screen/view/nav_bar.dart';
import 'package:poly_manage_systm/routes/app_pages.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'poly_manage_systm',
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
      getPages: AppPages.appPages(),
    );
  }
}
