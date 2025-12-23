import 'package:get/get.dart';

class ExamController extends GetxController {

  var selectedIndex = 0.obs;


  var dashboardList = List.generate(10, (index) => {
    "no": "${index + 1}",
    "title": "Diploma in engineering",
    "date": "25-12-12",
  }).obs;


  var routineList = List.generate(7, (index) => {
    "no": "${index + 1}",
    "title": index == 0 ? "Diploma in engineering 2022" : "Diploma in engineering",
    "date": "25-12-12",
  }).obs;


  void changeMenu(int index) {
    selectedIndex.value = index;
    Get.back();
  }

  void deleteDashboardItem(int index) => dashboardList.removeAt(index);
  void deleteRoutineItem(int index) => routineList.removeAt(index);
}