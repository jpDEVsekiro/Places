import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/login_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        backgroundColor: const Color(0xFF601534),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: Get.height * 0.35,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
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
                  height: Get.height * 0.65,
                  margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          onFieldSubmitted: (value) =>
                              controller.onSubmittedLogin(),
                          style: TextStyle(fontSize: Get.width * 0.05),
                          controller: controller.emailController,
                          onChanged: (value) => controller.onChangedTextField(),
                          cursorColor: const Color(0xFF601534),
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.02),
                              hintText: 'Email',
                              prefixIcon: const Icon(Icons.email,
                                  color: Color(0xFF601534)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    color: Color(0xFF601534), width: 0.8),
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.04),
                        child: TextFormField(
                            onFieldSubmitted: (value) =>
                                controller.onSubmittedPassword(),
                            focusNode: controller.focusPassword,
                            onChanged: (value) =>
                                controller.onChangedTextField(),
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
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF601534), width: 0.8),
                                ))),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: Get.height * 0.09, bottom: Get.height * 0.015),
                        child: Obx(
                          () => controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Color(0xFF601534))
                              : InkWell(
                                  onTap: () => controller.login(),
                                  child: Obx(
                                    () => controller.validLogin.value
                                        ? Container(
                                            width: Get.width * 0.5,
                                            height: Get.height * 0.06,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              color: const Color(0xFF601534),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                'Entrar',
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
                                                'Entrar',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.signUp(),
                        child: Text('Não tem conta? Criar conta',
                            style: TextStyle(
                                color: const Color(0xFF601534),
                                fontSize: Get.height * 0.02,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
