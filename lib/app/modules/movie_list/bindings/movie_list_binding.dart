import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/modules/movie_details/controllers/movie_details_controller.dart';

import '../controllers/movie_list_controller.dart';

class MovieListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieListController(), permanent: true);
    Get.put(MovieDetailsController(), permanent: true);

    MovieListController.to.getAllMovielistFromApi();
  }
}
