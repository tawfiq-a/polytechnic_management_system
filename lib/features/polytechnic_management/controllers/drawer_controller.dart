import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class polyController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedFileName = "".obs;
  var selectedStatus = "Approved".obs;


  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}
