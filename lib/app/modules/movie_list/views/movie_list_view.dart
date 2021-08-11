import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/data/model/MovielistModel.dart';
import 'package:kalyan_movie_app/app/modules/movie_details/controllers/movie_details_controller.dart';
import 'package:kalyan_movie_app/app/routes/app_pages.dart';

import '../controllers/movie_list_controller.dart';

class MovieListView extends GetView<MovieListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieListView'),
        centerTitle: true,
      ),
      body: GetX<MovieListController>(
        builder: (_) {
          if (controller?.homePageModel?.value?.page == null) {
            // return LoadingAnimationCart();

            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller?.homePageModel?.value?.results?.length,
              itemBuilder: (context, index) {
                Results singleMovie =
                    controller?.homePageModel?.value?.results[index];
                return SingleMovieListWidget(
                  singleMovie: singleMovie,
                  onPressed: () {
                    MovieDetailsController?.to?.id?.value = singleMovie.id;
                    Get.toNamed(Routes.MOVIE_DETAILS);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class SingleMovieListWidget extends StatelessWidget {
  const SingleMovieListWidget({
    Key key,
    @required this.singleMovie,
    @required this.onPressed,
  }) : super(key: key);

  final Results singleMovie;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text("${singleMovie?.title ?? ''}"),
    );
  }
}
