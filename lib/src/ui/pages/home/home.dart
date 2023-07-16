import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/controllers/home_controller.dart';
import 'package:my_places/src/ui/widgets/scaffold_places.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPlaces(
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
                      return ListTile(
                        title: Text(controller.places[index].name),
                        subtitle: Text(controller.places[index].cep),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
