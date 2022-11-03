import 'package:flutter/material.dart';

import '../../models/game_model.dart';
import 'game_by_category_card.dart';
import 'game_by_category_title_game_selected.dart';

class GameByCategorySuccessWidget extends StatelessWidget {

  const GameByCategorySuccessWidget({
    Key? key, 
    required this.categoryName, 
    required this.games,
  }) : super(key: key);

  final String categoryName;
  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleGameSelectedWidget( categoryName: categoryName),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            itemCount: games.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GameByCategoryCard(game: games[index],);
            }, separatorBuilder: (context, index) => const SizedBox( width: 25) ,
          ),
        ),
      ],
    );
  }
}