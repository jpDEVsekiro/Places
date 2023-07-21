import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:my_places/src/domain/models/method.dart';
import 'package:my_places/src/domain/models/place.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/providers/i_http.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';

class CreatePlaceController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
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
  final RxBool validPlace = false.obs;
  final RxString errorName = ''.obs;
  final RxString errorZipCode = ''.obs;
  final Place? place = Get.arguments;
  var zipCodeFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);
  final FocusNode focusZipCode = FocusNode();
  final FocusNode focusNumber = FocusNode();
  final FocusNode focusComplement = FocusNode();

  @override
  void onInit() {
    if (place != null) {
      nameController.text = place!.name;
      zipCodeController.text = place!.cep;
      streetController.text = place!.street;
      complementController.text = place!.complement;
      neighborhoodController.text = place!.neighbornhood;
      stateController.text = place!.state;
      cityController.text = place!.city;
      numberController.text = place!.number;
      valid();
    }
    super.onInit();
  }

  void createPlace() {
    if (valid() == false) {
      return;
    }
    isLoading.value = true;
    if (place == null) {
      _dataBaseRepository.createPlace(
          nameController.text,
          zipCodeController.text,
          streetController.text,
          complementController.text,
          neighborhoodController.text,
          stateController.text,
          cityController.text,
          numberController.text,
          user.id);
    } else {
      _dataBaseRepository.editPlace(
          place!.id,
          nameController.text,
          zipCodeController.text,
          streetController.text,
          complementController.text,
          neighborhoodController.text,
          stateController.text,
          cityController.text,
          numberController.text,
          user.id);
    }
    isLoading.value = false;
    Get.back();
  }

  Future<void> onChangedCep(String cep) async {
    if (cep.length == 8) {
      dynamic response = await http.request(
          url: '${zipCodeController.text}/json/', method: Method.get);
      if (response != false && response['erro'] == null) {
        errorZipCode.value = '';
        streetController.text = response['logradouro'];
        neighborhoodController.text = response['bairro'];
        stateController.text = response['uf'];
        cityController.text = response['localidade'];
      } else {
        errorZipCode.value = 'CEP inválido';
      }
      valid();
    }
  }

  bool valid() {
    if (nameController.text.length < 2) {
      validPlace.value = false;
      return false;
    } else if (zipCodeController.text.length != 9) {
      validPlace.value = false;
      return false;
    } else if (streetController.text.isEmpty) {
      validPlace.value = false;
      return false;
    } else if (errorName.isNotEmpty || errorZipCode.isNotEmpty) {
      validPlace.value = false;
      return false;
    }
    validPlace.value = true;
    return true;
  }

  void validName(String name) {
    if (name.length < 2) {
      errorName.value = 'Nome muito curto';
    } else {
      errorName.value = '';
    }
    valid();
  }

  void validZipCode(String zipCode) {
    if (zipCodeController.text.length != 9) {
      errorZipCode.value = 'CEP incompleto';
      streetController.text = '';
      neighborhoodController.text = '';
      stateController.text = '';
      cityController.text = '';
      valid();
    } else {
      onChangedCep(zipCode.replaceAll('-', ''));
    }
  }

  void onSubmittedName() {
    focusZipCode.requestFocus();
  }

  void onSubmittedZipCode() {
    focusNumber.requestFocus();
  }

  void onSubmittedNumber() {
    focusComplement.requestFocus();
  }

  void onSubmittedComplement() {
    createPlace();
  }
}
