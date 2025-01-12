import 'package:pelis_ya/config/domain/entities/movie.dart';

abstract class MoviesRepositori {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
