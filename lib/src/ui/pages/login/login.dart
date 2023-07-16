import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/login_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        body: Column(
      children: [
        TextField(controller: controller.emailController),
        TextField(controller: controller.passwordController),
        InkWell(
            onTap: controller.login,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            )),
        InkWell(
          onTap: controller.signUp,
          child: const Text('Criar conta'),
        )
      ],
    ));
  }
}
