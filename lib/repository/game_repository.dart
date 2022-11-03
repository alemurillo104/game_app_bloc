

import 'package:stripe_app/repository/services/game_service.dart';
import 'package:stripe_app/ui/home/models/game_model.dart';
import 'package:stripe_app/ui/home/models/genre_model.dart';

class GameRepository{

  final GameService gameService;

  GameRepository({ required this.gameService});

  Future<List<Genre>> getCategories() async  => gameService.getCategories();

  Future<List<Game>> getGamesByCategory(int genreId) async => gameService.getGamesByCategory(genreId);

  Future<List<Game>> getAllGames() async => gameService.getAllGames();

}