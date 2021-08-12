import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/no_internet_page/controllers/no_internet_page_controller.dart';
import 'app/modules/widgets/app_error_widget.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bool isDev = true;
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return AppErrorWidget(
      errorDetails: errorDetails,
      isDev: isDev,
    );
  };
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
    ),
  );
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NoInternetPageController(), permanent: true);
  }
}

showErrorPage() {
  bool isDev = true;
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return AppErrorWidget(
      errorDetails: errorDetails,
      isDev: isDev,
    );
  };
}
