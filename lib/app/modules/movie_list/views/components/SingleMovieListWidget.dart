import 'package:flutter/material.dart';

import 'package:kalyan_movie_app/app/data/model/MovielistModel.dart';
import 'package:kalyan_movie_app/app/modules/widgets/image_widget.dart';

import '../../../../../constants.dart';

class SingleMovieListWidget extends StatelessWidget {
  const SingleMovieListWidget({
    Key key,
    @required this.singleMovie,
    @required this.onPressed,
  }) : super(key: key);

  final Results singleMovie;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // image
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      child: ImageWidget(
                        imageUrl: "$image_url${singleMovie?.posterPath}",
                      ),
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,

                      // image: DecorationImage(
                      //     image: NetworkImage(
                      //         "$image_url${singleMovie?.posterPath}"),
                      //     fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                            color: mainColor,
                            blurRadius: 5.0,
                            offset: Offset(2.0, 5.0))
                      ],
                    ),
                  ),
                ),
                // text
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      children: [
                        Text(
                          "${singleMovie?.title ?? ''}",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Arvo',
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                        ),
                        Padding(padding: const EdgeInsets.all(2.0)),
                        Text(
                          "${singleMovie?.overview ?? ''}",
                          maxLines: 3,
                          style: TextStyle(
                              color: const Color(0xff8785A4),
                              fontFamily: 'Arvo'),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
