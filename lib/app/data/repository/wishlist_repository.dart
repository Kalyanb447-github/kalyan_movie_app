import 'dart:async';
import 'package:kalyan_movie_app/app/modules/widgets/alert.dart';
import 'package:kalyan_movie_app/app/networking/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MovieRepository {
  Response response;
  Completer completer = Completer();

  Future getAllMovielistFromApi() async {
    try {
      response = await Api().get('/popular');
      if (response.statusCode == 200) {
        completer.complete(response.data);
      }
    } catch (e) {
      // Alert().snaksbar("Alert!", e.toString());
      Alert().snaksbar("Sorry!", 'Something Went wrong');
    }
    return completer.future;
  }

  Future movieDertailsFromApi({@required String id}) async {
    try {
      response = await Api().get('/$id');
      if (response.statusCode == 200) {
        completer.complete(response.data);
      }
    } catch (e) {
      // Alert().snaksbar("Alert!", e.toString());
      Alert().snaksbar("Sorry!", 'Something Went wrong');
    }
    return completer.future;
  }
}
