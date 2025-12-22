import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poly_manage_systm/features/main_screen/view/main_screen.dart';
import 'package:poly_manage_systm/features/main_screen/view/nav_bar.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
