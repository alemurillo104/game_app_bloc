import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/ui/home/widgets/all_games_widget/all_games_success_widget.dart';
import 'package:stripe_app/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';

class AllGamesWidget extends StatelessWidget {
  const AllGamesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllGamesBloc, AllGamesState>(
      builder: (context, state) {
        // return AllGamesWidgetSuccess( games: state.games);
        return state.status.isSuccess
        ? AllGamesWidgetSuccess( games: state.games)
        : state.status.isLoading
          ? const Center(child:  CircularProgressIndicator())
          : state.status.isError
            ? const Text('ERROR')
            : const SizedBox();
      },
    );
  }
}
