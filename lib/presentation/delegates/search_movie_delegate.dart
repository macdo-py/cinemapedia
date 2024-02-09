import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String get searchFieldLabel => 'Search for movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //  print('query: $query');
    return [
      if (query.isNotEmpty)
        FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
                onPressed: () => query = '', icon: const Icon(Icons.clear))),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovies(query),
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return _MovieItem(movie: movies[index]);
            },
          );
        });
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return FadeIn(child: child);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              movie.posterPath,
              width: size.width * 0.2,
              height: size.height * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyles.titleMedium,
                maxLines: 2,),
                Text(movie.overview, style: textStyles.bodySmall
                , maxLines: 3, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              print('Add to favorites');
            },
            icon: Icon(Icons.favorite_border, color: colors.primary),
          )
        ],
      ),
    
    );
  }
}