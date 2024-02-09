import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {
  
  @override
  String get searchFieldLabel => 'Search for movies';
  
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text('buildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('buildLeading');
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