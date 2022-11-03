import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:stripe_app/repository/game_repository.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';

part 'games_by_category_event.dart';
part 'games_by_category_state.dart';

class GamesByCategoryBloc extends Bloc<GamesByCategoryEvent, GamesByCategoryState> {
  GamesByCategoryBloc( {
    required this.gameRepository
  }) : super(const GamesByCategoryState()) {

    on<GetGamesByCategory>( _mapGetGamesByCategoryEventToState );
  }

  final GameRepository gameRepository;

  void _mapGetGamesByCategoryEventToState( GetGamesByCategory event, Emitter<GamesByCategoryState> emit ) async {
    try {
      emit( state.copyWith( status: GamesByCategoryStatus.loading) );  

      List<Game> games = await gameRepository.getGamesByCategory(event.idSelected); //creo
      emit( state.copyWith(
        status: GamesByCategoryStatus.success,
        games: games,
        categoryName: event.categoryName
      ) );

    } catch (error) {
      emit( state.copyWith( status: GamesByCategoryStatus.error ));
    }
  }
}