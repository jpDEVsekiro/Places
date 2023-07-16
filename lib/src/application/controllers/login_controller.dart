import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/home_binding.dart';
import 'package:my_places/src/application/bindings/sign_up_binding.dart';
import 'package:my_places/src/domain/models/user.dart';
import 'package:my_places/src/domain/repositories/i_data_base_repository.dart';
import 'package:my_places/src/ui/pages/home/home.dart';
import 'package:my_places/src/ui/pages/sign_up/sign_up.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final IDataBaseRepository _dataBaseRepository =
      Get.find<IDataBaseRepository>();

  void signUp() {
    Get.to(() => const SignUp(), binding: SignUpBinding());
  }

  Future<void> login() async {
    if (valid() == false) {
      Get.snackbar('Erro:', 'Erro.toString()',
          icon: const Icon(Icons.error), snackPosition: SnackPosition.BOTTOM);
      return;
    } else {
      dynamic user = await _dataBaseRepository.login(
          emailController.text, passwordController.text);
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
