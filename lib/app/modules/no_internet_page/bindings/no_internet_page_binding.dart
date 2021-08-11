import 'package:get/get.dart';

import '../controllers/no_internet_page_controller.dart';

class NoInternetPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoInternetPageController>(
      () => NoInternetPageController(),
    );
  }
}
