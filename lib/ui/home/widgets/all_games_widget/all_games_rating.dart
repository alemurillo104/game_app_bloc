
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';

class AllGamesRating extends StatelessWidget {
  const AllGamesRating({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RatingBar.builder(
        initialRating: game.rating,
        minRating: 1,
        direction: Axis.horizontal,
        ignoreGestures: true,
        allowHalfRating: true,
        unratedColor: Colors.black45,
        itemCount: 5,
        itemSize: 16,
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {},
      ),
    );
  }
}


