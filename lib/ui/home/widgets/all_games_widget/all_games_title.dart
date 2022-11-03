import 'package:flutter/material.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';

class AllGamesTitle extends StatelessWidget {
  const AllGamesTitle({ Key? key, required this.game }) : super(key: key);

  final Game game;
  
  @override
  Widget build(BuildContext context) {
    return  Column(
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
      ],
    );
  }
}