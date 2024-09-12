import 'package:get/get.dart';
import 'package:testing_app/app/home/bindings/home_binding.dart';
import 'package:testing_app/app/home/views/home_view.dart';
import 'package:testing_app/root/bindings/root_binding.dart';
import 'package:testing_app/root/view/root_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => HomeView(),
          binding: HomeBinding(),
          participatesInRootNavigator: true,
          preventDuplicates: true,
        ),
      ],
    ),
  ];
}