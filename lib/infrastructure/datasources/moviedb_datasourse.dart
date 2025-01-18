import 'package:dio/dio.dart';
import 'package:pelis_ya/config/constants/environment.dart';
import 'package:pelis_ya/config/domain/datasources/movies_datasources.dart';

import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/infrastructure/mappers/movie_mapper.dart';
import 'package:pelis_ya/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasourse extends MoviesDatasources {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es-AR"
      }));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");
    final moviedbresponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviedbresponse.results
        .where((moviedb) => moviedb.posterPath != "no-poster")
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
