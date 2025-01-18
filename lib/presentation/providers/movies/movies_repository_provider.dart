import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_ya/infrastructure/datasources/moviedb_datasourse.dart';
import 'package:pelis_ya/infrastructure/repositories/movie_repository_impl.dart';

//* provider
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
