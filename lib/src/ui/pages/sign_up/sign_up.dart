import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/sign_up_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        body: SingleChildScrollView(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                width: Get.width,
                height: Get.height * 0.8,
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => TextField(
                            onChanged: controller.validName,
                            style: TextStyle(fontSize: Get.width * 0.05),
                            controller: controller.nameController,
                            cursorColor: const Color(0xFF465275),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.02),
                                hintText: 'Nome',
                                prefixIcon: const Icon(Icons.person,
                                    color: Color(0xFF465275)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                errorText: controller.errorName.value.isEmpty
                                    ? null
                                    : controller.errorName.value,
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Colors.red, width: 0.8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF465275), width: 0.8),
                                ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.04),
                        child: Obx(
                          () => TextField(
                              onChanged: controller.validEmail,
                              style: TextStyle(fontSize: Get.width * 0.05),
                              controller: controller.emailController,
                              cursorColor: const Color(0xFF465275),
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02),
                                  hintText: 'Email',
                                  prefixIcon: const Icon(Icons.email,
                                      color: Color(0xFF465275)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  errorText: controller.errorEmail.value.isEmpty
                                      ? null
                                      : controller.errorEmail.value,
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF465275), width: 0.8),
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.04),
                        child: Obx(
                          () => TextField(
                              onChanged: controller.validPassword,
                              style: TextStyle(fontSize: Get.width * 0.05),
                              obscureText: true,
                              controller: controller.passwordController,
                              cursorColor: const Color(0xFF465275),
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02),
                                  hintText: 'Senha',
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Color(0xFF465275)),
                                  focusColor: const Color(0xFF465275),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  errorText:
                                      controller.errorPassword.value.isEmpty
                                          ? null
                                          : controller.errorPassword.value,
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF465275), width: 0.8),
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.04),
                        child: Obx(
                          () => TextField(
                              onChanged: controller.validConfirmPassword,
                              style: TextStyle(fontSize: Get.width * 0.05),
                              obscureText: true,
                              controller: controller.confirmPasswordController,
                              cursorColor: const Color(0xFF465275),
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: Get.width * 0.02),
                                  hintText: 'Comfirmar senha',
                                  prefixIcon: const Icon(Icons.lock,
                                      color: Color(0xFF465275)),
                                  focusColor: const Color(0xFF465275),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  errorText: controller
                                          .errorConfirmPassword.value.isEmpty
                                      ? null
                                      : controller.errorConfirmPassword.value,
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Colors.red, width: 0.8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF465275), width: 0.8),
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Get.height * 0.09, bottom: Get.height * 0.015),
                        child: Obx(
                          () => controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Color(0xFF465275))
                              : InkWell(
                                  onTap: () => controller.signUp(),
                                  child: Obx(
                                    () => controller.validUser.value
                                        ? Container(
                                            width: Get.width * 0.5,
                                            height: Get.height * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: const Color(0xFF465275),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Criar Conta',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: Get.width * 0.5,
                                            height: Get.height * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: Colors.grey,
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Criar Conta',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
