import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/routes/app_pages.dart';

class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  final bool isDev;

  const AppErrorWidget({
    Key key,
    @required this.errorDetails,
    this.isDev = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          // 'Error',
          isDev ? 'Error' : '',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      // body: Container(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 20,
            ),
            // Container(
            //   height: 250,
            //   width: 250,
            //   child: Image.asset(
            //     'assets/error_page_crop.png',
            //     fit: BoxFit.contain,
            //   ),
            // ),
            Text(
              'Something was wrong',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Sorry we are having some technical issues\n(as we can see), Try to refresh this page.\nSometimes works :)',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            Container(
              // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: OutlineButton(
                onPressed: () {
                  Get.toNamed(Routes.MOVIE_LIST);
                },
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                borderSide: BorderSide(color: Colors.blue),
                shape: StadiumBorder(),
              ),
            ),

            //   height: Sizes.s100,
            //   width: Sizes.s100,
            // ),
            // Container(
            //   height: Sizes.s20,
            // ),

            // Container(
            //   height: Sizes.s10,
            // ),
            // Text(
            //   Strings.crashFinalMessage,
            //   style: TextStyles.defaultRegular.copyWith(
            //     fontSize: FontSize.s18,
            //   ),
            //   textAlign: TextAlign.justify,
            // ),
            // Container(
            //   height: Sizes.s10,
            // ),

            Text(
              isDev ? '${errorDetails.summary}' : '',
            ),

            // Container(
            //   height: Sizes.s10,
            // ),
            // if (isDev)
            //   Text(
            //     "asdsf ${errorDetails}",
            //     style: TextStyles.defaultRegular.copyWith(
            //       fontSize: FontSize.s13,
            //       color: Colors.red,
            //     ),
            //   ),

            Text(
              isDev ? '${errorDetails.toString()}' : '',
            ),
            // AppButton(
            //   text: Strings.restartApp,
            //   onTap: () {
            //     AppRoutes.makeFirst(context, SplashScreen());
            //   },
            // ),
            // Container(
            //   height: Sizes.s50,
            // ),
          ],
        ),
      ),
    );
  }
}
