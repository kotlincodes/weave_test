import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weave_test/controller/home_controller.dart';
import 'package:weave_test/screens/home_screen.dart';

class Routes {
  static const homeScreen = "/splash";

  static final routes = [
    GetPage(
        binding: BindingsBuilder(() {
          Get.put(HomeController());
        }),
        name: homeScreen,
        page: () => const HomeScreen(
              key: Key(homeScreen),
            )),
  ];
}
