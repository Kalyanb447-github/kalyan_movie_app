import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kalyan_movie_app/app/modules/no_internet_page/controllers/no_internet_page_controller.dart';

// class NoInternetPageView extends GetView<NoInternetPageController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NoInternetPageView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'NoInternetPageView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

class NoInternetPageView extends GetView<NoInternetPageController> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback() async {
      NoInternetPageController.to.checkInternet();

      return null;
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 100,
                image: AssetImage(
                  'assets/images/no-signal.png',
                ),
                fit: BoxFit.cover,
              ),
              //
              SizedBox(
                height: 10,
              ),
              Text(
                'please check your internet connectivity\n and try again',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.black,
                      fontFamily: 'Raleway-Regular',
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: () async {
                  NoInternetPageController.to.checkInternet();
                },
                child: Text(
                  'Try again',
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return WillPopScope(
    //   onWillPop: _willPopCallback,
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     // appBar: CustomAppBar(
    //     //   titleWidget: Text(''),
    //     // ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Image(
    //             height: 100,
    //             image: AssetImage(
    //               'assets/images/no-signal.png',
    //             ),
    //             fit: BoxFit.cover,
    //           ),
    //           //
    //           SizedBox(
    //             height: getScreenHeight(10),
    //           ),
    //           Text(
    //             'please check your internet connectivity\n and try again',
    //             style: Theme.of(context).textTheme.subtitle1.copyWith(
    //                   color: Colors.grey,
    //                   fontFamily: 'Raleway-Regular',
    //                 ),
    //             textAlign: TextAlign.center,
    //           ),
    //           SizedBox(
    //             height: getScreenHeight(10),
    //           ),
    //           RaisedButton(
    //             color: kPrimaryColor,
    //             onPressed: () async {
    //               NoInternetPageController.to.checkInternet();
    //             },
    //             child: Text(
    //               'Try again',
    //               style: Theme.of(context).textTheme.button.copyWith(
    //                     color: Colors.black,
    //                   ),
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
