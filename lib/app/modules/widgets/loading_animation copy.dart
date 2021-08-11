import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingAnimationCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // color: Colors.transparent,
        alignment: Alignment.center,
        height: Get.height,
        width: Get.width,

        child: FlareActor("assets/animation/ecommerce_load.flr",
            // ecommerce_load
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: 'loading'),
      ),
    );
  }
}

class LoadingAnimationTruck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 200,
        // height: Get.height,
        width: Get.width,
        child: FlareActor("assets/animation/truck.flr",
            // ecommerce_load
            alignment: Alignment.topLeft,
            // fit: BoxFit.contain,
            fit: BoxFit.fitWidth,
            animation: 'truck'),
      ),
    );
  }
}

class LoadingSuccessAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: FlareActor("assets/animation/Success.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: 'Untitled'),
    );
  }
}
