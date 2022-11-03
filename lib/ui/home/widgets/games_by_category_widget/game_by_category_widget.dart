import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/games_by_category_bloc.dart';
import 'game_by_category_success_widget.dart';

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
