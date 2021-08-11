import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/data/model/MovielistModel.dart';
import 'package:kalyan_movie_app/app/data/repository/wishlist_repository.dart';

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();

  Rx<MovielistModel> homePageModel = MovielistModel().obs;

  RxInt id = 0.obs;

  movieDertailsFromApi() async {
    var response = await MovieRepository().movieDertailsFromApi(id: id.value);
    homePageModel.value = MovielistModel.fromJson(response);
  }
}
