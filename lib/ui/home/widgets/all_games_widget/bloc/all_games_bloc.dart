import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:stripe_app/repository/game_repository.dart';
import '../../../models/game_model.dart';

part 'all_games_event.dart';
part 'all_games_state.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {
  AllGamesBloc({ required this.gameRepository}) : super(const AllGamesState()) {
    on<GetAllGames>( _mapGetAllGamesEventToState );
  }

  final GameRepository gameRepository;

  void _mapGetAllGamesEventToState( GetAllGames event, Emitter<AllGamesState> emit ) async {

    try {
      emit(state.copyWith(status: AllGamesStatus.loading));

      List<Game> allGames = await gameRepository.getAllGames();

      emit(state.copyWith(status: AllGamesStatus.success, games: allGames));

    } catch (e) {
      debugPrint(e.toString());
      emit( state.copyWith(status: AllGamesStatus.error) );
    }
  }
}
