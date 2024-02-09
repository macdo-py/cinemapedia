import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  @override
  String get searchFieldLabel => 'Search for movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    //  print('query: $query');
    return [
      if (query.isNotEmpty)
      FadeIn(
        animate: query.isNotEmpty,
        child: 
          IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear)
          )
          ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(
          onPressed: () => close(context, null),
          icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestions');
  }
}
