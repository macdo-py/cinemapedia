import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:dio/dio.dart';

class MoviesDbDataSource extends MoviesDataSource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Environment.theMovieDbKey,
    'language': 'es-ES',
  }));

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final respones = await dio.get('/movie/now_playing');
    
    final List<Movie> movies = [];

    return [];
  }
}
