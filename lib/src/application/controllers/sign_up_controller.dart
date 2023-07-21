import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/home_binding.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/home/home.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();
  final RxBool isLoading = false.obs;
  final RxBool validUser = false.obs;
  final RxString errorName = ''.obs;
  final RxString errorEmail = ''.obs;
  final RxString errorPassword = ''.obs;
  final RxString errorConfirmPassword = ''.obs;
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();

  Future<void> signUp() async {
    if (valid() == false) {
      return;
    } else {
      isLoading.value = true;
      dynamic user = await _dataBaseRepository.createAccount(
          nameController.text, emailController.text, passwordController.text);
      if (user is User) {
        Get.put(user, permanent: true);
        Get.offAll(() => const Home(), binding: HomeBinding());
      } else {
        Get.snackbar('Erro', user.toString(),
            icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      }
      isLoading.value = false;
    }
  }

  bool valid() {
    if (emailController.text.length < 4 || passwordController.text.length < 6) {
      validUser.value = false;
      return false;
    } else if (emailController.text.isEmail == false) {
      validUser.value = false;
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      validUser.value = false;
      return false;
    } else if (nameController.text.length < 2) {
      validUser.value = false;
      return false;
    }
    validUser.value = true;
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

  void validEmail(String email) {
    if (email.length < 4 || email.isEmail == false) {
      errorEmail.value = 'Email inválido';
    } else {
      errorEmail.value = '';
    }
    valid();
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

  void onSubmittedName() {
    focusEmail.requestFocus();
  }

  void onSubmittedEmail() {
    focusPassword.requestFocus();
  }

  void onSubmittedPassword() {
    focusConfirmPassword.requestFocus();
  }

  void onSubmittedConfirmPassword() {
    signUp();
  }
}
