import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  // ০ = Dashboard, ১ = Student, ২ = Payment
  var selectedIndex = 0.obs;
  var selectedFileName = "".obs;
  var selectedStatus = "Approved".obs;

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

  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}
