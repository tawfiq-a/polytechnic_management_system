import 'package:get/get.dart';

class AttendanceController extends GetxController {
  var presentDays = 18.obs;
  var absentDays = 4.obs;
  var lateDays = 2.obs;


  var reportPeriod = "01 May - 22 May 2024".obs;

  double get attendancePercentage {
    int total = presentDays.value + absentDays.value + lateDays.value;
    if (total == 0) return 0.0;
    return (presentDays.value / total) * 100;
  }


  var attendanceHistory = [
    {"date": "22 May 2024", "status": "Present", "day": "Wednesday", "time": "09:00 AM"},
    {"date": "21 May 2024", "status": "Absent", "day": "Tuesday", "time": "--:--"},
    {"date": "20 May 2024", "status": "Late", "day": "Monday", "time": "10:15 AM"},
    {"date": "19 May 2024", "status": "Present", "day": "Sunday", "time": "08:55 AM"},
    {"date": "18 May 2024", "status": "Present", "day": "Saturday", "time": "09:05 AM"},
  ].obs;
}