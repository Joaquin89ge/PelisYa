import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pelis_ya/config/domain/entities/movie.dart';
import 'package:pelis_ya/config/helpers/human_formats.dart';

class MoviesHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  const MoviesHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  State<MoviesHorizontalListview> createState() =>
      _MoviesHorizontalListviewState();
}

class _MoviesHorizontalListviewState extends State<MoviesHorizontalListview> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null || widget.subTitle != null)
          _Title(
            title: widget.title,
            subTitle: widget.subTitle,
          ),
        SizedBox(height: 5),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.maxFinite,
            minHeight: 200,
            maxHeight: 350,
          ),
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.movies.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final movie = widget.movies[index];

              return SizedBox(
                width: 160,
                height: double.maxFinite,
                child: _Slide(
                  movie: movie,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.subTitle, this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: ButtonStyle(visualDensity: VisualDensity.standard),
              onPressed: () {},
              child: Text(subTitle!),
            )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    //final double screenWidth = MediaQuery.of(context).size.width;
    //final double screenHeight = MediaQuery.of(context).size.height;
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //*poster
          Expanded(
            // Expand the ClipRRect to fill available height
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      // No need for SizedBox.expand here anymore
                      decoration: BoxDecoration(color: Colors.black12),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          const SizedBox(height: 5),
          //*title
          SizedBox(
            width: 160,
            child: Text(movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
          ),
          Row(
            children: [
              Icon(
                Icons.star_half_rounded,
                color: Colors.yellow.shade800,
              ),
              Text(movie.voteAverage.toStringAsFixed(1),
                  style: textStyles.bodySmall
                      ?.copyWith(color: Colors.yellow.shade900)),
              const SizedBox(width: 10),
              Text("${movie.releaseDate.year}", style: textStyles.bodyMedium),
              const SizedBox(width: 10),
              Text(HumanFormats.number(movie.popularity),
                  style: textStyles.bodyMedium),
            ],
          )
        ],
      ),
    );
  }
}
