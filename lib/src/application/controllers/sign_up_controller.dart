import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/home_binding.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/home/home.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();

  Future<void> signUp() async {
    if (valid() == false) {
      Get.snackbar('Erro:', 'Erro.toString()',
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      return;
    } else {
      dynamic user = await _dataBaseRepository.createAccount(
          nameController.text, emailController.text, passwordController.text);
      if (user is User) {
        Get.put(user, permanent: true);
        Get.offAll(() => const Home(), binding: HomeBinding());
      } else {
        Get.snackbar('Erro:', user.toString(),
            icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  bool valid() {
    return true;
  }
}
