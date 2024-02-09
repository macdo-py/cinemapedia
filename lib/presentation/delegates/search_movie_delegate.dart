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
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                onTap: () => close(context, movie),
              );
            },
            

          );
        });
  }
}
