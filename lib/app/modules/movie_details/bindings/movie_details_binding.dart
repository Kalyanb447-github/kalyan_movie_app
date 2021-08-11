import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/modules/movie_details/controllers/movie_details_controller.dart';

class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController(), permanent: true);

    MovieDetailsController.to.movieDertailsFromApi();
  }
}
