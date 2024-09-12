import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_app/root/controllers/root_controller.dart';
import 'package:testing_app/routes/app_pages.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          body: GetRouterOutlet(
              initialRoute: Routes.HOME
          ),
        );
      },
    );
  }
}


