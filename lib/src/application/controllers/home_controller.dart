import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/create_place_binding.dart';
import 'package:my_places/src/application/bindings/login_binding.dart';
import 'package:my_places/src/domain/models/place.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/create_place/create_place.dart';
import 'package:my_places/src/ui/pages/login/login.dart';

class HomeController extends GetxController {
  User user = Get.find<User>();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();
  RxList<Place> places = <Place>[].obs;

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

  Future<void> deletePlace(Place place) async {
    await Get.defaultDialog(
      title: 'Excluir',
      content: const Text('Você deseja excluir esse lugar?'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                width: Get.width * 0.5,
                height: Get.height * 0.07,
                alignment: Alignment.center,
                child: const Text('Cancelar'),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  await _dataBaseRepository.deletePlace(place.id);
                  Get.back();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(20))),
                  height: Get.height * 0.07,
                  alignment: Alignment.center,
                  child: const Text('Excluir'),
                ),
              ),
            )
          ],
        )
      ],
    );
    getPlaces();
  }

  Future<void> editPlace(Place place) async {
    await Get.to(() => const CreatePlace(),
        binding: CreatePlaceBinding(), arguments: place);
    await getPlaces();
  }

  void logOut() {
    Get.delete<User>(force: true);
    Get.offAll(() => const Login(), binding: LoginBinding());
  }
}
