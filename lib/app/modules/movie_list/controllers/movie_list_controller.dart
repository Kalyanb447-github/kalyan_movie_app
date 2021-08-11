import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/data/model/MovielistModel.dart';
import 'package:kalyan_movie_app/app/data/repository/wishlist_repository.dart';
import 'package:kalyan_movie_app/app/utilities/print_log.dart';

class MovieListController extends GetxController {
  static MovieListController get to => Get.find();

  Rx<MovielistModel> homePageModel = MovielistModel().obs;

  RxInt totalAmount = 0.obs;

  getAllMovielistFromApi() async {
    var response = await MovieRepository().getAllMovielistFromApi();
    homePageModel?.value = MovielistModel.fromJson(response);

    printGreen(homePageModel?.value?.toJson().toString());
  }
}
