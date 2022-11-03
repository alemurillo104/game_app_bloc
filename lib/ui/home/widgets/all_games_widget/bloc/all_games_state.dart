part of 'all_games_bloc.dart';

enum AllGamesStatus { initial, loading, success, error}

extension AllGamesStatusX on AllGamesStatus{
  bool get isInitial => this == AllGamesStatus.initial;
  bool get isLoading => this == AllGamesStatus.loading;
  bool get isSuccess => this == AllGamesStatus.success;
  bool get isError   => this == AllGamesStatus.error;
}

class AllGamesState extends Equatable {
  const AllGamesState({
    List<Game>? games, 
    this.status = AllGamesStatus.initial
  }) : games = games ?? const [];

  final List<Game> games;
  final AllGamesStatus status;
  
  @override
  List<Object> get props => [ games, status ];

  AllGamesState copyWith({
    List<Game>? games,
    AllGamesStatus? status
  }) => AllGamesState(
    games: games ?? this.games, 
    status: status ?? this.status
  );
}