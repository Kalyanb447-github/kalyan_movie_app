import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/data/model/MovielistModel.dart';
import 'package:kalyan_movie_app/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:kalyan_movie_app/app/modules/widgets/loading_animation.dart';
import 'package:kalyan_movie_app/app/routes/app_pages.dart';

import '../controllers/movie_list_controller.dart';
import 'components/SingleMovieListWidget.dart';

class MovieListView extends GetView<MovieListController> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      controller.onClose();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies List'),
          centerTitle: true,
        ),
        body: GetX<MovieListController>(
          builder: (_) {
            if (controller?.homePageModel?.value?.page == null) {
              return LoadingAnimation();
            } else {
              return ListView.builder(
                itemCount: controller?.homePageModel?.value?.results?.length,
                itemBuilder: (context, index) {
                  Results singleMovie =
                      controller?.homePageModel?.value?.results[index];
                  return SingleMovieListWidget(
                    singleMovie: singleMovie,
                    onPressed: () {
                      MovieDetailsController?.to?.id?.value = singleMovie?.id;
                      Get.toNamed(Routes.MOVIE_DETAILS);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
