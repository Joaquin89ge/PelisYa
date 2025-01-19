import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/presentation/providers/movies/movies_providers.dart';

final MoviesSlideshowProvider = Provider<List<Movie>>(
  (ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    if (nowPlayingMovies.isEmpty) return [];

    return nowPlayingMovies.sublist(0, 6);
  },
);
