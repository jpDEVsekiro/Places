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
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Place', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: controller.onChangedCep,
              controller: controller.cepController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'cep'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.streetController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'rua'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.complementController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Complemento'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.neighborhoodController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Bairro'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.stateController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'estado'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.cityController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'cidade'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.numberController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'numero'),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => controller.isLoading.value == true
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    controller.createPlace();
                  },
                  child: const Text('Create Place'))),
          const SizedBox(height: 20),
        ],
      ),
    ));
  }
}
