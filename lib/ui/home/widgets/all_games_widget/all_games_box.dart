import 'package:flutter/material.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/all_games_title.dart';

import '../../models/game_model.dart';
import 'all_games_button.dart';
import 'all_games_image.dart';
import 'all_games_rating.dart';

class GameBox extends StatelessWidget {
  const GameBox({
    Key? key, required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 213, 211, 211),
            borderRadius: BorderRadius.circular(25)),
        child: Stack(
          children:  [
            Positioned(
              top: 12, left: 20,
              child: AllGamesImage(game: game)
            ),
            Positioned(
              top: 20, left: 80,
              child: AllGamesTitle(game: game)
            ),
            Positioned(
              top: 62, left: 80,
              child: AllGamesRating(game: game)
            ),
            const Positioned(
              bottom: 20, right: 20,
              child: AllGamesButton()
            ),
          ],
        )
      ),
    );
  }
}
