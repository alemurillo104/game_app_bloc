import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';

import 'bloc/games_by_category_bloc.dart';

class GameByCategoryWidget extends StatelessWidget {
  const GameByCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesByCategoryBloc, GamesByCategoryState>(
      builder: (context, state) {
        return (state.status.isSuccess)
        ? GameByCategorySuccessWidget(
            categoryName: state.categoryName, 
            games: state.games,
          )
        : (state.status.isLoading)
          ? const Center(child: CircularProgressIndicator())
          : (state.status.isError)
            ? const Text('error widget ')
            : const SizedBox()
        ;
      },
    );
  }
}

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
          // height: 130,
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
              return _HorizontalCarrousel(game: games[index],);
            }, separatorBuilder: (context, index) => const SizedBox( width: 25) ,
          ),
        ),
      ],
    );
  }
}

class TitleGameSelectedWidget extends StatelessWidget {

  final String categoryName;

  const TitleGameSelectedWidget({
    Key? key, required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
     child: Text(
      categoryName,
       textAlign: TextAlign.start,
       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
     ),
            );
  }
}

class _HorizontalCarrousel extends StatelessWidget {
  const _HorizontalCarrousel({
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
                  placeholder: const NetworkImage(
                    'https://images.hdqwalls.com/download/mountains-landscape-dark-nature-4k-i0-1920x1080.jpg'
                  ),
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


class GameByCategorySuccessWidget2 extends StatelessWidget {
  const GameByCategorySuccessWidget2({
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
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            bottom: 16.0,
          ),
          child: Text(
            categoryName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _HorizontalCarrousel( game: games[index] );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: 25.0,
            ),
            itemCount: games.length,
          ),
        ),
      ],
    );
  }
}
