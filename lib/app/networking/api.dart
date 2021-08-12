import 'package:dio/native_imp.dart';
import 'package:kalyan_movie_app/app/networking/interceptors.dart';

class Api extends DioForNative {
  // var storage = Hive.box('storage');
  Api() {
    options.baseUrl = "https://api.themoviedb.org/3/movie";

    // options.connectTimeout = 5000;
    // options.receiveTimeout = 3000;
    // kalyan
    options.connectTimeout = 15000 * 60;
    options.receiveTimeout = 15000 * 60;
    CustomInterceptors refreshFlow = CustomInterceptors(this);
    interceptors.add(refreshFlow);
  }
}
