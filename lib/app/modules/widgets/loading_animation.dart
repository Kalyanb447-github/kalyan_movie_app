import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: FlareCacheBuilder(
          [
            AssetFlare(
              bundle: rootBundle,
              name: "assets/animation/ecommerce_load.flr",
            ),
          ],
          builder: (BuildContext context, bool isWarm) {
            return !isWarm
                ? Container(child: CircularProgressIndicator())
                : FlareActor(
                    "assets/animation/ecommerce_load.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.none,
                    animation: 'loading',
                  );
          },
        ),

        // FlareActor("assets/animation/ecommerce_load.flr",
        //     // ecommerce_load
        //     alignment: Alignment.center,
        //     // sizeFromArtboard: true,
        //     fit: BoxFit.none,
        //     animation: 'loading'),
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
        child: FlareCacheBuilder(
          [
            AssetFlare(
              bundle: rootBundle,
              name: "assets/animation/truck.flr",
            ),
          ],
          builder: (BuildContext context, bool isWarm) {
            return !isWarm
                ? Container(child: CircularProgressIndicator())
                : FlareActor(
                    "assets/animation/truck.flr",
                    alignment: Alignment.topLeft,
                    fit: BoxFit.fitWidth,
                    animation: 'truck',
                  );
          },
        ),

        // FlareActor("assets/animation/truck.flr",
        //     // ecommerce_load
        //     alignment: Alignment.topLeft,
        //     // fit: BoxFit.contain,
        //     fit: BoxFit.fitWidth,
        //     animation: 'truck'),
      ),
    );
  }
}

class LoadingSuccessAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: FlareCacheBuilder(
        [
          AssetFlare(
            bundle: rootBundle,
            name: "assets/animation/Success.flr",
          ),
        ],
        builder: (BuildContext context, bool isWarm) {
          return !isWarm
              ? Container(child: CircularProgressIndicator())
              : FlareActor(
                  "assets/animation/Success.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: 'Untitled',
                );
        },
      ),

      // FlareActor("assets/animation/Success.flr",
      //     alignment: Alignment.center,
      //     fit: BoxFit.contain,
      //     animation: 'Untitled'),
    );
  }
}
