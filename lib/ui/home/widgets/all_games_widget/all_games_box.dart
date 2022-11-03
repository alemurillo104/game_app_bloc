import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                AllGamesImage(game: game),
               
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.name,
                      style:
                        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      game.slug,
                      style: const TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                    const SizedBox(height: 7),
                    AllGamesRating(game: game)
                  ],
                ),
                // const SizedBox(width: 10),
                const AllGamesButton(),
                // Align(
                //   alignment: AlignmentDirectional.bottomEnd,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         primary: Colors.amberAccent,
                //       ),
                //       onPressed: () {},
                //       child: const Text('View more',
                //           style: TextStyle(color: Colors.black))),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
