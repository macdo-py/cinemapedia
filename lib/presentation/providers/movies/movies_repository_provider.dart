

import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este tipo de provider es de solo lectura
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviesDbDataSource());
});

