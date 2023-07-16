import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/create_place_binding.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/create_place/create_place.dart';

class HomeController extends GetxController {
  User user = Get.find<User>();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();
  RxList places = [].obs;

  @override
  void onInit() {
    getPlaces();
    super.onInit();
  }

  Future<void> addPlace() async {
    await Get.to(() => const CreatePlace(), binding: CreatePlaceBinding());
    await getPlaces();
  }

  Future<void> getPlaces() async {
    places.clear();
    places.addAll(await _dataBaseRepository.getPlaces(user.id));
  }
}
