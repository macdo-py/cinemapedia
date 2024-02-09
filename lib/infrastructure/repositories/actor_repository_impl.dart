

import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

 class ActorsRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorsRepositoryImpl(this.datasource);
  

  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
  

}








// class MovieRepositoryImpl extends MoviesRepository {
//   final MoviesDatasource datasource;
//   MovieRepositoryImpl(this.datasource);

//   @override
//   Future<List<Movie>> getNowPlaying({int page = 1}) {
//     return datasource.getNowPlaying(page: page);
//   }