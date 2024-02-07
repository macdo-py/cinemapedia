import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  
  @override
  _HomeViewState createState() => _HomeViewState();
}


class _HomeViewState extends ConsumerState<_HomeView> {
  
  @override
  void initSate(){
    super.initState();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    final popularMovies = ref.watch(popularMoviesProvider);
    
    return ListView.builder(
      itemCount: popularMovies.length,
      itemBuilder: (context, index) {
        final movie = popularMovies[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          leading: Image.network(movie.posterPath),
        );
      },
    );
  }
}
