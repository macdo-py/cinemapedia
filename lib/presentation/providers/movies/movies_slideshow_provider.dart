import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


final moviesSlideshowProvider = Provider<List<Movie>>((ref) {

final nowPlaying = ref.watch(nowPlayingMoviesProvider );

  if ( nowPlaying.isEmpty) return [];

  return nowPlaying.sublist(0, 6);

});