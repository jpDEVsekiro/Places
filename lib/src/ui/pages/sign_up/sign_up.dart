import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/sign_up_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        body: Column(
      children: [
        const Text('Sign Up'),
        TextField(controller: controller.nameController),
        TextField(
          controller: controller.emailController,
        ),
        TextField(
          controller: controller.passwordController,
        ),
        TextField(
          controller: controller.confirmPasswordController,
        ),
        InkWell(
          onTap: () => controller.signUp(),
          child: const Text('Sign Up'),
        )
      ],
    ));
  }
}
