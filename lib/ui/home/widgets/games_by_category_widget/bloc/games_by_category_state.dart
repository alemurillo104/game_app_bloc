part of 'games_by_category_bloc.dart';

enum GamesByCategoryStatus { initial, success, error, loading }

extension GamesByCategoryStatusX on GamesByCategoryStatus{
  bool get isInitial => this == GamesByCategoryStatus.initial;
  bool get isSuccess => this == GamesByCategoryStatus.success;
  bool get isError   => this == GamesByCategoryStatus.error;
  bool get isLoading => this == GamesByCategoryStatus.loading;
}

class GamesByCategoryState extends Equatable {
  const GamesByCategoryState({
    List<Game>? games, 
    this.status = GamesByCategoryStatus.initial, 
    String? categoryName
  }): games = games ?? const [],
      categoryName = categoryName ?? '';
  
  final List<Game> games;
  final GamesByCategoryStatus status;
  final String categoryName;

  GamesByCategoryState copyWith({
   List<Game>? games,
   GamesByCategoryStatus? status,
   String? categoryName
  }) => GamesByCategoryState(
    games        : games        ?? this.games, 
    status       : status       ?? this.status, 
    categoryName : categoryName ?? this.categoryName
  );

  @override
  List<Object> get props => [games, status, categoryName];
}