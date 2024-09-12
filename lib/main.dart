import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing_app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        getPages: AppPages.routes,
        initialBinding: BindingsBuilder(() {
            // Get.put(FilterService());
        })
    );
  }
}
