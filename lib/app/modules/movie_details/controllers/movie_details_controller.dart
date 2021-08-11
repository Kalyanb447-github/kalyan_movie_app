import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/data/model/MovieDetailsModel.dart';
import 'package:kalyan_movie_app/app/data/repository/movie_repository.dart';
import 'package:kalyan_movie_app/app/utilities/print_log.dart';

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();

  Rx<MovieDetailsModel> movieDetailsModel = MovieDetailsModel().obs;

  RxInt id = 0.obs;

  movieDertailsFromApi() async {
    var response = await MovieRepository().movieDertailsFromApi(id: id.value);
    movieDetailsModel.value = MovieDetailsModel.fromJson(response);

    printGreen(movieDetailsModel?.value?.toJson().toString());
  }

  @override
  void onClose() {
    super.onClose();
    movieDetailsModel.value = MovieDetailsModel();

    id.value = 0;
  }
}
