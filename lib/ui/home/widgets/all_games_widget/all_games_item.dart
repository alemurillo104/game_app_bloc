import 'package:flutter/material.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/all_games_button.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/all_games_rating.dart';

import 'all_games_image.dart';

class AllGamesItem extends StatelessWidget {
  const AllGamesItem({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.withOpacity(.1),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20.0,
            top: 15.0,
            bottom: 15.0,
            child: AllGamesImage(
              game: game,
            ),
          ),
          Positioned(
            top: 25.0,
            left: 100.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                game.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            left: 100.0,
            top: 45.0,
            child: Text(
              game.name ?? '',
              // game.genres?.first.name ?? '',
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
          ),
          Positioned(
            top: 65.0,
            left: 100.0,
            child: AllGamesRating(
              game: game,
            ),
          ),
          const Positioned(
            right: 20.0,
            bottom: 10.0,
            child:  AllGamesButton(),
          ),
        ],
      ),
    );
  }
}
