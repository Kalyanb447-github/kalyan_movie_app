import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kalyan_movie_app/app/utilities/print_log.dart';

Connectivity connectivity = Connectivity();

class CustomInterceptors extends InterceptorsWrapper {
  Dio previous;
  Dio refreshDio = Dio();

  // var storage = Hive.box('storage');
  final storage = GetStorage();

  CustomInterceptors(previous) {
    this.previous = previous;
  }

  //  @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   print('REQUEST[${options.method}] => PATH: ${options.path}');
  //   return super.onRequest(options, handler);
  // }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // log('send request：${options.baseUrl}${options.path}');

    printGreen('send request');

    printWhite('${options.baseUrl}${options.path}');
    // get [token] from shared or localStorage or Redis Or Sqflite
    // String accessToken = await getToken();
    // String accessToken = 'd414b646a8027b6728daa92d42c8e577';

    // if (accessToken == null) {
    //   if (options.path.toString() != "/getOtp" &&
    //       options.path.toString() != "/login-mobile" &&
    //       options.path.toString() != "/signin" &&
    //       options.path.toString() != "/signup" &&
    //       options.path.toString() != "/register" &&
    //       //options.path.toString() != "/resend_otp_again" &&
    //       options.path.toString() != "/page") {
    //     await logout();
    //   }
    // }

    options.queryParameters["api_key"] = "d414b646a8027b6728daa92d42c8e577";

    // options.headers["api_key"] = "d414b646a8027b6728daa92d42c8e577";

    // options.headers["Authorization"] = "Bearer $accessToken";
    // options.headers["x-request-id"] = 'request-id';

    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  logout() async {
    // await clearTokens();

    return;
    // throw DioError(error: 'Token not found. Please do Login.');
  }

  // Future saveToken(String token) async => await storage.write('token', token);

  // Future getToken() async {
  //   try {
  //     // User tempUser = storage.get('user');
  //     final token = await storage?.read('token') ?? '';
  //     // debugPrint("TOKEN==== ${token ?? ''} ");
  //     printCyan("Api TOKEN");
  //     printGreen("${token ?? ''}");
  //     return token;
  //   } catch (e) {
  //     log("EXCEPTION====== BO TOKEN" + e.toString());
  //     return null;
  //   }
  // }

  // saveRefresh(String token) async => await storage.write('token', token);

  // getRefreshToken() async => await storage.read('app-refresh');

  // Future clearTokens() async => await storage.erase();

  // 200 && 201 OK
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // return response; // continue
    return super.onResponse(response, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.error != null && err.error is SocketException;
  }

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription.cancel();
          responseCompleter.complete(
            refreshDio.request(requestOptions.path,
                cancelToken: requestOptions.cancelToken,
                data: requestOptions.data,
                onReceiveProgress: requestOptions.onReceiveProgress,
                onSendProgress: requestOptions.onSendProgress,
                queryParameters: requestOptions.queryParameters,
                options: Options(
                    method: requestOptions.method,
                    sendTimeout: requestOptions.sendTimeout,
                    receiveTimeout: requestOptions.receiveTimeout,
                    extra: requestOptions.extra,
                    headers: requestOptions.headers,
                    responseType: requestOptions.responseType,
                    contentType: requestOptions.contentType,
                    validateStatus: requestOptions.validateStatus,
                    receiveDataWhenStatusError:
                        requestOptions.receiveDataWhenStatusError,
                    followRedirects: requestOptions.followRedirects,
                    maxRedirects: requestOptions.maxRedirects,
                    requestEncoder: requestOptions.requestEncoder,
                    responseDecoder: requestOptions.responseDecoder,
                    listFormat: requestOptions.listFormat)),
          );
        }
      },
    );

    return responseCompleter.future;
  }

  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    print(error?.error);
    if (_shouldRetry(error)) {
      try {
        return scheduleRequestRetry(error.requestOptions);
      } catch (e) {
        return e;
      }
    }
    // return error;
    print(
        'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
    return super.onError(error, handler);
  }
}
