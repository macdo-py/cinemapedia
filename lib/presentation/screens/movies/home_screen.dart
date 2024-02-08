import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar : CustomBottomNavigation(),
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
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final sildeshowmovies = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [
        CustomAppBar(),
        MoviesSlideshow(movies: sildeshowmovies),
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: nowPlayingMovies.length,
        //     itemBuilder: (context, index) {
        //       final movie = nowPlayingMovies[index];
        //       return ListTile(
        //         title: Text(movie.title),
        //       );
        //     },
        //   ),
        // )
        MovieHorizontalListView(
          movies: nowPlayingMovies,
          title: 'En Cines',
          subtitle: 'Esta semana',
          )
      ],
    );
  }
}
