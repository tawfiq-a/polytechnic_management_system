import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedFileName = "".obs;

  // file pick function
  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
      );

      if (result != null) {
        //   selectedFileName.value = result.files.single.name;
        selectedFileName.value = result.files.single.name;

        Get.snackbar(
          "Success",
          "File Selected: ${result.files.single.name}",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        print("User cancelled the picker");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  var dashboardList = List.generate(
    10,
    (index) => {
      "no": "${index + 1}",
      "title": "Diploma in engineering",
      "date": "25-12-12",
    },
  ).obs;

  var routineList = List.generate(
    7,
    (index) => {
      "no": "${index + 1}",
      "title": index == 0
          ? "Diploma in engineering 2022"
          : "Diploma in engineering",
      "date": "25-12-12",
    },
  ).obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
    Get.back();
  }

  void deleteDashboardItem(int index) => dashboardList.removeAt(index);
  void deleteRoutineItem(int index) => routineList.removeAt(index);
}
