import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../home/domain/movie_model.dart';
import '../../data/movie_repository.dart';

class PopularMoviesNotifier extends AsyncNotifier<List<Movie>> {
  @override
  FutureOr<List<Movie>> build() {
    return getMovies();
  }

  getMovies() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(movieRepository).popularMovies(page: 1),
    );
  }
}

final popularMoviesProvider = AsyncNotifierProvider<PopularMoviesNotifier, List<Movie>>(PopularMoviesNotifier.new);
