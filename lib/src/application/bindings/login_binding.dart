import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
