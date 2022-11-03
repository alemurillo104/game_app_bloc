import 'dart:convert';

import 'package:stripe_app/ui/home/models/game_model.dart';

Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));

String genreToJson(Genre data) => json.encode(data.toJson());

class Genre {
    Genre({
      required this.id,
      required this.name,
      required this.slug,
      required this.gamesCount,
      required this.imageBackground,
      required this.games,
    });

    int id;
    String name;
    String slug;
    int gamesCount;
    String imageBackground;
    List<Game> games;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
    };
}
