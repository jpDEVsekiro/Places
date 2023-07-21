import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';

class ChangePasswordController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();
  final RxBool isLoading = false.obs;
  final RxBool validUser = false.obs;
  final RxBool validOldPasswod = false.obs;
  final RxString errorOldPassword = ''.obs;
  final RxString errorPassword = ''.obs;
  final RxString errorConfirmPassword = ''.obs;
  final User _user = Get.find<User>();

  bool valid() {
    if (oldPasswordController.text != _user.password) {
      validUser.value = false;
      return false;
    } else if (passwordController.text.length < 6) {
      validUser.value = false;
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      validUser.value = false;
      return false;
    }
    validUser.value = true;
    return true;
  }

  void validPassword(String password) {
    if (password.length < 6) {
      errorPassword.value = 'Senha muito curta';
    } else {
      errorPassword.value = '';
    }
    validConfirmPassword(confirmPasswordController.text);
    valid();
  }

  void validConfirmPassword(String confirmPassword) {
    if (confirmPassword != passwordController.text) {
      errorConfirmPassword.value = 'Senhas não coincidem';
    } else {
      errorConfirmPassword.value = '';
    }
    valid();
  }

  void validOldPassword(String oldPassword) {
    if (oldPassword != _user.password) {
      errorOldPassword.value = 'Senha incorreta';
      validOldPasswod.value = false;
      passwordController.text = '';
      confirmPasswordController.text = '';
    } else {
      validOldPasswod.value = true;
      errorOldPassword.value = '';
    }
    valid();
  }

  Future<void> changePassword() async {
    if (valid() == false) {
      return;
    } else {
      isLoading.value = true;
      await _dataBaseRepository.changePassword(
          passwordController.text, _user.id);
      Get.back();
      isLoading.value = false;
    }
  }
}
