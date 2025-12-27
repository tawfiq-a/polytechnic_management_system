import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:poly_manage_systm/features/main_screen/view/main_screen.dart';
import '../features/auth/views/email_verify.dart';
import '../features/auth/views/forget_pass.dart';
import '../features/auth/views/instructor_register.dart';
import '../features/auth/views/register_options.dart';
import '../features/auth/views/set_new_pass.dart';
import '../features/auth/views/sign_in.dart';
import '../features/auth/views/student_register.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage<dynamic>> appPages() => [
    GetPage(name: AppRoutes.dashboard, page: () => MainScreen()),

    //-----------------Authentication-----------------//
    GetPage(name: AppRoutes.login, page: () => LoginView()),
    GetPage(name: AppRoutes.emailVerify, page: () => EmailVerificationView()),
    GetPage(name: AppRoutes.forgotPass, page: () => ForgotPasswordView()),
    GetPage(name: AppRoutes.setNewPass, page: () => SetNewPasswordView()),
    GetPage(name: AppRoutes.registerSelect, page: () => RegisterSelectView()),
    GetPage(name: AppRoutes.studentRegister, page: () => StudentRegisterView()),
    GetPage(name: AppRoutes.instructorRegister, page: () => InstructorRegisterView()),



  ];
}
