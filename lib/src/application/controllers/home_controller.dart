import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/change_password_binding.dart';
import 'package:my_places/src/application/bindings/create_place_binding.dart';
import 'package:my_places/src/application/bindings/login_binding.dart';
import 'package:my_places/src/domain/models/place.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/change_password/change_password.dart';
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
    await Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: SizedBox(
        height: Get.height * 0.24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.025),
              child: Text('Excluir',
                  style: TextStyle(
                      fontSize: Get.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF601534))),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Text(
                'Você realmente deseja excluir esse lugar?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: Get.width * 0.045),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF601534),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      width: Get.width * 0.4,
                      height: Get.height * 0.07,
                      alignment: Alignment.center,
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await _dataBaseRepository.deletePlace(place.id);
                      Get.back();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFFE9557F),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20))),
                      height: Get.height * 0.07,
                      alignment: Alignment.center,
                      child: const Text('Excluir',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
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

  Future<void> changePassword() async {
    await Get.to(() => const ChangePassword(),
        binding: ChangePasswordBinding());
    await getPlaces();
  }
}
