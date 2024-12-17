import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController()); // Register UserController
  }
}
