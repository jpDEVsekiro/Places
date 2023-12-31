import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/create_place_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class CreatePlace extends GetView<CreatePlaceController> {
  const CreatePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.07),
              child: Obx(
                () => TextFormField(
                    onFieldSubmitted: (text) => controller.onSubmittedName(),
                    onChanged: controller.validName,
                    style: TextStyle(fontSize: Get.width * 0.05),
                    controller: controller.nameController,
                    cursorColor: const Color(0xFF601534),
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                        hintText: 'Nome',
                        prefixIcon:
                            const Icon(Icons.home, color: Color(0xFF601534)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorText: controller.errorName.value.isEmpty
                            ? null
                            : controller.errorName.value,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFE9557F), width: 0.8),
                        ),
                        errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFE9557F), width: 0.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF601534), width: 0.8),
                        ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: Obx(
                () => TextFormField(
                    onFieldSubmitted: (text) => controller.onSubmittedZipCode(),
                    focusNode: controller.focusZipCode,
                    onChanged: controller.validZipCode,
                    style: TextStyle(fontSize: Get.width * 0.05),
                    controller: controller.zipCodeController,
                    cursorColor: const Color(0xFF601534),
                    keyboardType: TextInputType.number,
                    inputFormatters: [controller.zipCodeFormatter],
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                        hintText: 'CEP',
                        prefixIcon: const Icon(Icons.add_location_alt,
                            color: Color(0xFF601534)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorText: controller.errorZipCode.value.isEmpty
                            ? null
                            : controller.errorZipCode.value,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFE9557F), width: 0.8),
                        ),
                        errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFFE9557F), width: 0.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF601534), width: 0.8),
                        ))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                onChanged: (text) => controller.valid(),
                style: TextStyle(fontSize: Get.width * 0.05),
                controller: controller.streetController,
                cursorColor: const Color(0xFF601534),
                decoration: InputDecoration(
                    enabled: false,
                    hintText: 'Rua',
                    alignLabelWithHint: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                    prefixIcon: const Icon(Icons.add_road_rounded,
                        color: Color(0xFF601534)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFE9557F), width: 0.8),
                    ),
                    errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFE9557F), width: 0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                          color: Color(0xFF601534), width: 0.8),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                  onFieldSubmitted: (text) => controller.onSubmittedNumber(),
                  focusNode: controller.focusNumber,
                  onChanged: (text) => controller.valid(),
                  style: TextStyle(fontSize: Get.width * 0.05),
                  controller: controller.numberController,
                  cursorColor: const Color(0xFF601534),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Numero',
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      prefixIcon: const Icon(Icons.add_road_rounded,
                          color: Color(0xFF601534)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF601534), width: 0.8),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                  onFieldSubmitted: (text) =>
                      controller.onSubmittedComplement(),
                  focusNode: controller.focusComplement,
                  onChanged: (text) => controller.valid(),
                  style: TextStyle(fontSize: Get.width * 0.05),
                  controller: controller.complementController,
                  cursorColor: const Color(0xFF601534),
                  decoration: InputDecoration(
                      hintText: 'Complemento',
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      prefixIcon: const Icon(Icons.add_road_rounded,
                          color: Color(0xFF601534)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF601534), width: 0.8),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                  onChanged: (text) => controller.valid(),
                  style: TextStyle(fontSize: Get.width * 0.05),
                  controller: controller.neighborhoodController,
                  cursorColor: const Color(0xFF601534),
                  decoration: InputDecoration(
                      hintText: 'Bairro',
                      enabled: false,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      prefixIcon: const Icon(Icons.add_road_rounded,
                          color: Color(0xFF601534)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF601534), width: 0.8),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                  onChanged: (text) => controller.valid(),
                  style: TextStyle(fontSize: Get.width * 0.05),
                  controller: controller.cityController,
                  cursorColor: const Color(0xFF601534),
                  decoration: InputDecoration(
                      hintText: 'Cidade',
                      enabled: false,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      prefixIcon: const Icon(Icons.add_road_rounded,
                          color: Color(0xFF601534)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF601534), width: 0.8),
                      ))),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.04),
              child: TextFormField(
                  onChanged: (text) => controller.valid(),
                  style: TextStyle(fontSize: Get.width * 0.05),
                  controller: controller.stateController,
                  cursorColor: const Color(0xFF601534),
                  decoration: InputDecoration(
                      hintText: 'Estado',
                      enabled: false,
                      alignLabelWithHint: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                      prefixIcon: const Icon(Icons.add_road_rounded,
                          color: Color(0xFF601534)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
                      ),
                      errorStyle: const TextStyle(color: Color(0xFFE9557F)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                            color: Color(0xFFE9557F), width: 0.8),
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
                child: Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator(color: Color(0xFF601534))
                    : InkWell(
                        onTap: () => controller.createPlace(),
                        child: Obx(
                          () => controller.validPlace.value
                              ? Container(
                                  width: Get.width * 0.5,
                                  height: Get.height * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: const Color(0xFF601534),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.place != null
                                          ? 'Editar Lugar'
                                          : 'Criar Lugar',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: Get.width * 0.5,
                                  height: Get.height * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.grey,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.place != null
                                          ? 'Editar Lugar'
                                          : 'Criar Lugar',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                        )))),
          ],
        ),
      ),
    ));
  }
}
