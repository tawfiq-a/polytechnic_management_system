import 'package:file_picker/file_picker.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditProfileController extends GetxController {
  var isOldPassVisible = false.obs;
  var isNewPassVisible = false.obs;
  var isConfirmPassVisible = false.obs;

  void toggleOldPass() => isOldPassVisible.value = !isOldPassVisible.value;
  void toggleNewPass() => isNewPassVisible.value = !isNewPassVisible.value;

  void toggleConfirmPass() =>
      isConfirmPassVisible.value = !isConfirmPassVisible.value;

  var selectedImageName = "".obs;

  Future<void> pickProfileImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      selectedImageName.value = result.files.single.name;
    }
  }
}
