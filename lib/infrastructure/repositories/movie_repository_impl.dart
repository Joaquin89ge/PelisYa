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

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
}
