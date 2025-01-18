import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/config/domain/repositories/movies_repositori.dart';
import 'package:pelis_ya/infrastructure/datasources/moviedb_datasourse.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviedbDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
