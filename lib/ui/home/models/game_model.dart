
class Game {
    Game({
      required this.id,
      required this.slug,
      required this.name,
      required this.added,
      required this.backgroundImage,
      required this.rating,
      required this.ratingTop,
    });

    int id;
    String slug;
    String name;
    int added;
    String backgroundImage;
    double rating;
    int ratingTop;

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id              : json["id"],
        slug            : json["slug"],
        name            : json["name"],
        added           : json["added"],
        backgroundImage : json["background_image"] ?? '',
        rating          : json["rating"] ?? 0,
        ratingTop       : json["rating_top"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
      "id"               : id,
      "slug"             : slug,
      "name"             : name,
      "added"            : added,
      "background_image" : backgroundImage,
      "rating"           : rating,
      "rating_top"       : ratingTop,
    };
}
