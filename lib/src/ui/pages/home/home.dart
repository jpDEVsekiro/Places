import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/home_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
        appBar: AppBar(
          title: Text(
              'Olá ${controller.user.name.contains(' ') ? controller.user.name.substring(0, controller.user.name.indexOf(' ')) : controller.user.name}'),
          actions: [
            InkWell(onTap: controller.logOut, child: const Icon(Icons.person))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.addPlace,
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.places.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ExpansionTile(
                          collapsedIconColor: Colors.black,
                          iconColor: Colors.black,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: Get.height * 0.02,
                                    bottom: Get.height * 0.01),
                                child: Text(controller.places[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.width * 0.05)),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: Get.height * 0.01),
                                child: Text(
                                    'Rua: ${controller.places[index].street} ${controller.places[index].number}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.width * 0.04)),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding:
                                EdgeInsets.only(bottom: Get.height * 0.015),
                            child: Text('CEP: ${controller.places[index].cep}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Get.width * 0.04)),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () => controller
                                      .editPlace(controller.places[index]),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20))),
                                    width: Get.width * 0.5,
                                    height: Get.height * 0.07,
                                    alignment: Alignment.center,
                                    child: const Text('Editar'),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => controller
                                        .deletePlace(controller.places[index]),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(20))),
                                      height: Get.height * 0.07,
                                      alignment: Alignment.center,
                                      child: const Text('Excluir'),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
