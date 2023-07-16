import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
