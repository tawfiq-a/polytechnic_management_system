import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProfileController extends GetxController {
  var userData = {
    // Dummy data
    "name": "Mir Tawfiq Al Sayem",
    "email": "tawfiq.cst@gmail.com",
    "roll": "651087",
    "semester": "8th Semester",
    "dept": "Computer Science and Technology",
    "image": "https://i.pravatar.cc/150?u=9",
  }.obs;
}
