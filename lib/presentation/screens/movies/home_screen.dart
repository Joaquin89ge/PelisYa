import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_ya/presentation/providers/providers_barrel.dart';
import 'package:pelis_ya/presentation/widgets/widgets_barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = "home-string";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final sliderShowMovies = ref.watch(MoviesSlideshowProvider);

    if (sliderShowMovies.isEmpty) return CircularProgressIndicator();
    return Column(
      children: [CustomAppbar(), MoviesSlideshow(movies: sliderShowMovies)],
    );
  }
}
