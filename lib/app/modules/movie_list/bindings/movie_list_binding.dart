import 'package:get/get.dart';

import '../controllers/movie_list_controller.dart';

class MovieListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieListController(), permanent: true);

    MovieListController.to.getAllMovielistFromApi();
    // MovieListController.to.getAllMovielistFromApi();
  }
}
