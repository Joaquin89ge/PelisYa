import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != "")
          ? "https://image.tmdb.org/t/p/w500${moviedb.backdropPath}"
          : "data:image/jpeg;base64,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",
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != "")
          ? "https://image.tmdb.org/t/p/w500${moviedb.posterPath}"
          : "data:image/png;base64,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",
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
