import 'package:flutter/material.dart';

import '../../models/game_model.dart';
import 'all_games_box.dart';

class AllGamesWidgetSuccess extends StatelessWidget {
  const AllGamesWidgetSuccess({
    Key? key, required this.games,
  }) : super(key: key);

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Games',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: games.length,
                itemBuilder: (_, int index) => GameBox( game: games[index] ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}