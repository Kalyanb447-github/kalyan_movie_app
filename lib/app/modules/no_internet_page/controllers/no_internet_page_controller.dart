import 'package:kalyan_movie_app/app/modules/no_internet_page/views/no_internet_page_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetPageController extends GetxController {
  static NoInternetPageController get to => Get.find();

  // Stream<ConnectivityResult> internetStream;
  @override
  void onInit() {
    super.onInit();
    // checkInternet = Connectivity().onConnectivityChanged;
  }

  startInternetStream() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result.index != 2) {
          // Get.back();
          print('${Get.previousRoute}');
          print('${Get.currentRoute}');
          if (Get.isDialogOpen) {
            // HomeController.to.refresh();
            Get.back();

            // Navigator.pop(Get.context);
            Navigator.pushNamed(Get.context, Get.currentRoute)
                .then((value) => Get.back());
            //  Navigator.removeRoute(Get.context,   MaterialPageRoute(builder: (_) => DeeplyNestedView()));
            // Get.removeRoute(Get.currentRoute);
            print('${Get.previousRoute}');
            print('${Get.currentRoute}');
          } else {
            Navigator.pushNamed(Get.context, Get.currentRoute)
                .then((value) => Get.back());
          }

          // Get.toNamed(Get.currentRoute);
        } else if (result.index == 2) {
          Get.dialog(
            NoInternetPageView(),
            barrierDismissible: false,
          );
        }
      },
    );
  }

  checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.index == 2) {
      Fluttertoast.showToast(msg: 'No internet connection!');
      //Alert().snaksbar("Sorry!", 'No internet');
    } else {
      // Get.back();
      print('${Get.previousRoute}');
      print('${Get.currentRoute}');
      Navigator.pushNamed(Get.context, Get.currentRoute)
          .then((value) => Get.back());
      // Get.back();
      // Get.toNamed(Get.currentRoute);
      // Get.toNamed(Get.previousRoute);
      // Get.toNamed(Routes.HOME);
    }
  }

  // @override
  // void onReady() {}

  @override
  void onClose() {
    // internetConnectivityCheck();
  }

  // Future<bool> internetConnectivityCheck() {
  //   Completer completer = Completer<bool>();
  //   checkInternet.listen((ConnectivityResult result) {
  //     // Got a new connectivity status!
  //     if (result.index == 2) {
  //       // Get.dialog(NoInternetConnection());
  //       Get.toNamed(Routes.NO_INTERNET_PAGE);
  //       print('no internet');

  //       return false;
  //     } else {
  //       return true;
  //     }
  //   });

  //   return completer.future;
  // }

  // void increment() => count.value++;
}
