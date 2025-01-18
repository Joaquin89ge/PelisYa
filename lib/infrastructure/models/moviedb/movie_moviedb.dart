class MovieMovieDB {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieMovieDB({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieMovieDB.fromJson(Map<String, dynamic> json) => MovieMovieDB(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ??
            "data:image/jpeg;base64,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",
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"] ?? "",
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"] ??
            "no-poster", //TODO: revienta si no hay imagen despues se corrigue
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
