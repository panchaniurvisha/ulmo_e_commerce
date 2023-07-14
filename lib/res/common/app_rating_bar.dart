import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppRatingBar extends StatelessWidget {
  final double? size;
  const AppRatingBar({
    super.key,
    this.size,
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
      itemBuilder: (context, _) => SizedBox(
          height: height / 60,
          child: Icon(Icons.star,
              color: Colors.amber, size: size ?? height / 100)),
      onRatingUpdate: (rating) {
        debugPrint("rating-------->$rating");
      },
    );
  }
}
