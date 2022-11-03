import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_app/ui/home/models/game_model.dart';
import 'package:stripe_app/ui/home/models/genre_model.dart';

import '../../env.dart';

class GameService{

  Future<List<Genre>> getCategories() async {

    try {
      Map<String, String> params = {
        'key': Env.apiKey
      };

      var url = Uri.https(Env.url, '/api/genres', params);
      var response = await http.get(url);
      
      if (response.statusCode == 200) {

        Map<String, dynamic> decodedData = jsonDecode(response.body);
        List<dynamic> list = decodedData['results'];
        List<Genre> genres = list.map((genre) => Genre.fromJson(genre) ).toList();
        debugPrint('OK');
        return genres;
      }
      debugPrint('ERROR');
      return [];

    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Game>> getGamesByCategory( int genreId) async {
    try {

      var url = Uri.https(Env.url, '/api/games',{
        'key': Env.apiKey,
        'genres' : genreId.toString()
      });

      var response = await http.get(url);

      if (response.statusCode == 200) {
        
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        List<dynamic> results = decodedData['results'];
        List<Game> games = results.map((game) => Game.fromJson(game)).toList();
        debugPrint('OK');
        return games;
      }
      
      debugPrint('ERROR');
      return [];

    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Game>> getAllGames() async {

    try {
      
      var url = Uri.https(Env.url, '/api/games', {
        'key' : Env.apiKey
      });

      var response = await http.get(url);

      if (response.statusCode == 200) {
        
        var decodedData = json.decode(response.body);
        List<dynamic> list = decodedData['results'];
        List<Game> games = list.map((game) => Game.fromJson(game) ).toList();
        debugPrint('OK allgames');
        return games;
      }
      
      debugPrint('ERROR getAllGames');
      return [];

    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}