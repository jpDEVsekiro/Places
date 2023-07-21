import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/change_password_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class ChangePassword extends GetView<ChangePasswordController> {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        backgroundColor: const Color(0xFF601534),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: Get.height * 0.2,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.05,
                        vertical: Get.height * 0.035),
                    child: Image.asset(
                      'assets/images/places.jpg',
                    )),
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
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.04),
                            child: Obx(
                              () => TextField(
                                  onChanged: controller.validOldPassword,
                                  style: TextStyle(fontSize: Get.width * 0.05),
                                  obscureText: true,
                                  controller: controller.oldPasswordController,
                                  cursorColor: const Color(0xFF601534),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.02),
                                      hintText: 'Senha Antiga',
                                      prefixIcon: const Icon(Icons.lock,
                                          color: Color(0xFF601534)),
                                      focusColor: const Color(0xFF601534),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      errorText: controller
                                              .errorOldPassword.value.isEmpty
                                          ? null
                                          : controller.errorOldPassword.value,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Color(0xFFE9557F)),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFF601534),
                                            width: 0.8),
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
                                  cursorColor: const Color(0xFF601534),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.02),
                                      hintText: 'Senha',
                                      prefixIcon: const Icon(Icons.lock,
                                          color: Color(0xFF601534)),
                                      focusColor: const Color(0xFF601534),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      enabled: controller.validOldPasswod.value,
                                      errorText:
                                          controller.errorPassword.value.isEmpty
                                              ? null
                                              : controller.errorPassword.value,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Color(0xFFE9557F)),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFF601534),
                                            width: 0.8),
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
                                  controller:
                                      controller.confirmPasswordController,
                                  cursorColor: const Color(0xFF601534),
                                  decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      enabled: controller.validOldPasswod.value,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.02),
                                      hintText: 'Comfirmar senha',
                                      prefixIcon: const Icon(Icons.lock,
                                          color: Color(0xFF601534)),
                                      focusColor: const Color(0xFF601534),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      errorText: controller.errorConfirmPassword
                                              .value.isEmpty
                                          ? null
                                          : controller
                                              .errorConfirmPassword.value,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      errorStyle: const TextStyle(
                                          color: Color(0xFFE9557F)),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFE9557F),
                                            width: 0.8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFF601534),
                                            width: 0.8),
                                      ))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: Get.height * 0.09,
                                bottom: Get.height * 0.015),
                            child: Obx(
                              () => controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Color(0xFF601534))
                                  : InkWell(
                                      onTap: controller.changePassword,
                                      child: Obx(
                                        () => controller.validUser.value
                                            ? Container(
                                                width: Get.width * 0.5,
                                                height: Get.height * 0.06,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  color:
                                                      const Color(0xFF601534),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Mudar Senha',
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
                                                      BorderRadius.circular(
                                                          15.0),
                                                  color: Colors.grey,
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Mudar Senha',
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
