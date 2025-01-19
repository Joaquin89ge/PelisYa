import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pelis_ya/config/domain/entities/movie.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    //final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
        width: double.infinity,
        height: screenHeight * 0.33,
        child: Swiper(
          pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
              builder: DotSwiperPaginationBuilder(
                  activeColor: colors.primary,
                  color: colors.secondary,
                  activeSize: 15)),
          itemCount: movies.length,
          viewportFraction: 0.8,
          scale: 0.8,
          autoplay: false,
          itemBuilder: (context, index) => _Slider(movie: movies[index]),
        ));
  }
}

class _Slider extends StatelessWidget {
  final Movie movie;

  const _Slider({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12));
                  }
                  return FadeIn(child: child);
                },
              ))),
    );
  }
}
