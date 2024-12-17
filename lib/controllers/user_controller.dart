import 'package:get/get.dart';

class UserController extends GetxController {
  RxString userRole = ''.obs;

  void setUserRole(String role) {
    userRole.value = role;
  }
}
