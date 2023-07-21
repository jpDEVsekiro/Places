import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_places/src/application/bindings/login_binding.dart';
import 'package:my_places/src/infra/repositories/sqflite_repository.dart';
import 'package:my_places/src/ui/pages/login/login.dart';

import 'src/domain/repositories/i_data_base_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF601534),
      statusBarBrightness: Brightness.light));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.lazyPut<IDataBaseRepository>(() => SqfliteRepository());
  await Get.find<IDataBaseRepository>().init();
  runApp(GetMaterialApp(
    defaultTransition: Transition.noTransition,
    debugShowCheckedModeBanner: false,
    home: const Login(),
    initialBinding: LoginBinding(),
  ));
}
