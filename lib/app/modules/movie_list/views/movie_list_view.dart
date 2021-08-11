import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_list_controller.dart';

class MovieListView extends GetView<MovieListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MovieListView'),
          centerTitle: true,
        ),
        body: GetX<MovieListController>(builder: (_) {
          if (controller?.homePageModel?.value?.page == null) {
            return LoadingAnimationCart();
          } else {}
        }));
  }
}
