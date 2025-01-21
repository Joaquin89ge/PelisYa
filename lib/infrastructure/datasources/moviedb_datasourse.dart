import 'package:dio/dio.dart';
import 'package:pelis_ya/config/constants/environment.dart';
import 'package:pelis_ya/config/domain/datasources/movies_datasources.dart';

import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/infrastructure/mappers/movie_mapper.dart';
import 'package:pelis_ya/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDatasources {
  final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.theMovieDbKey,
        "language": "es-AR"
      }));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final moviedbresponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = moviedbresponse.results
        .where((moviedb) => moviedb.posterPath != "no-poster")
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get("/movie/now_playing", queryParameters: {"page": page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get("/movie/popular", queryParameters: {"page": page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get("/movie/top_rated", queryParameters: {"page": page});
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get("/movie/upcoming", queryParameters: {"page": page});
    return _jsonToMovies(response.data);
  }
}
