import 'package:flutter/material.dart';

import '../../models/game_model.dart';

class GameByCategoryCard extends StatelessWidget {

  const GameByCategoryCard({
    Key? key, required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children:  [
                SizedBox(
                child: FadeInImage(
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('loading.gif'),
                  image: NetworkImage( game.backgroundImage )
                ),
              ),
              Positioned(
                top: 85,
                right: 0,
                left: 0,
                child: Container(
                  height: 35,
                  color: Colors.white30,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      game.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}