

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {
 
  Future<List<Movie>> getPopularMovies({int page=1});
  
}