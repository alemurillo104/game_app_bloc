import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'all_games_box.dart';
import 'all_games_item.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc, AllGamesState>(
      builder: (context, state) {
        return AllGamesWidgetSuccess( games: state.games);
      },
    );
  }
}

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
                itemBuilder: (_, int index) => AllGamesItem( game: games[index] ),
                // itemBuilder: (_, int index) => GameBox( game: games[index] ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
