import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:kalyan_movie_app/app/modules/widgets/image_widget.dart';
import 'package:kalyan_movie_app/app/modules/widgets/loading_animation.dart';

import '../../../../constants.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      controller.onClose();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: GetX<MovieDetailsController>(
          builder: (_) {
            if (controller?.movieDetailsModel?.value?.id == null) {
              return LoadingAnimation();
            } else {
              return SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // background image
                    ImageWidget(
                      imageUrl:
                          "$image_url${controller?.movieDetailsModel?.value?.posterPath}",
                    ),
                    // back filter
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                width: Get.width,
                                height: Get.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: ImageWidget(
                                    imageUrl:
                                        "$image_url${controller?.movieDetailsModel?.value?.posterPath}",
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 20.0,
                                        offset: Offset(0.0, 10.0))
                                  ]),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 0.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                    "${controller?.movieDetailsModel?.value?.title ?? ''}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontFamily: 'Arvo'),
                                  )),
                                  Text(
                                    '${controller?.movieDetailsModel?.value?.voteAverage ?? ''}/10',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: 'Arvo'),
                                  )
                                ],
                              ),
                            ),
                            Text(
                                "${controller?.movieDetailsModel?.value?.overview ?? ''}",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Arvo')),
                            Padding(padding: const EdgeInsets.all(10.0)),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                  width: 150.0,
                                  height: 60.0,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Rate Movie',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Arvo',
                                        fontSize: 20.0),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: const Color(0xaa3C3261)),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0xaa3C3261)),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.bookmark,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: const Color(0xaa3C3261)),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
