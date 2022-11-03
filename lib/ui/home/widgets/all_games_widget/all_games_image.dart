
import 'package:flutter/material.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';

class AllGamesImage extends StatelessWidget {
  const AllGamesImage({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: const AssetImage('no-image.jpg'),
          image: NetworkImage(game.backgroundImage),
        ),
      ),
    );
  }
}


