import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      // itemPadding: const EdgeInsets.symmetric(horizontal: .0),
      itemBuilder: (context, _) => Padding(
        padding: EdgeInsets.symmetric(horizontal: height / 80),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      ),
      onRatingUpdate: (rating) {
        debugPrint("rating-------->$rating");
      },
    );
  }
}
