import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_places/src/domain/models/method.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/providers/i_http.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';

class CreatePlaceController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController complementController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  IHttp http = Get.find<IHttp>();
  User user = Get.find<User>();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();
  RxBool isLoading = false.obs;

  void createPlace() {
    if (valid() == false) {
      return;
    }
    isLoading.value = true;
    _dataBaseRepository.createPlace(
        nameController.text,
        cepController.text,
        streetController.text,
        complementController.text,
        neighborhoodController.text,
        stateController.text,
        cityController.text,
        numberController.text,
        user.id);
    isLoading.value = false;
    Get.back();
  }

  Future<void> onChangedCep(String cep) async {
    if (cep.length == 8) {
      dynamic response = await http.request(
          url: '${cepController.text}/json/', method: Method.get);
      if (response != false) {
        streetController.text = response['logradouro'];
        neighborhoodController.text = response['bairro'];
        complementController.text = response['complemento'];
        stateController.text = response['uf'];
        cityController.text = response['localidade'];
      }
      print(response);
    }
  }

  valid() {}
}
