

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
 
  Future<List<Movie>> getPopularMovies({int page=1});
  
}