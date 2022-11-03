import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/repository/game_repository.dart';
import 'package:stripe_app/repository/services/game_service.dart';
import 'package:stripe_app/ui/home/home_layout.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:stripe_app/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:stripe_app/ui/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => GameRepository(gameService: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AllGamesBloc(
                gameRepository: context.read<GameRepository>()
              )..add(GetAllGames()),
            ),
            BlocProvider(
              create: (context) => CategoryBloc(
                gameRepository: context.read<GameRepository>()
              )..add(GetCategories()),
            ),
            BlocProvider(
              create: (context) => GamesByCategoryBloc(
                gameRepository: context.read<GameRepository>()
              ),
            ),
          ],
          child: const HomeLayout(),
        ),
      )
    );
  }
}
