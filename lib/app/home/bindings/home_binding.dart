import 'package:get/get.dart';
import 'package:testing_app/app/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  HomeBinding();

  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
