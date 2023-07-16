import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/create_place_controller.dart';
import 'package:my_places/src/domain/providers/i_http.dart';
import 'package:my_places/src/infra/providers/http/dio_http.dart';

class CreatePlaceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHttp>(() => DioHttp());
    Get.put(CreatePlaceController());
  }
}
