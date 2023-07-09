import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../home/domain/movie_model.dart';
import '../../data/movie_repository.dart';

class NowPlayingMoviesNotifier extends AsyncNotifier<List<Movie>> {
  @override
  FutureOr<List<Movie>> build() {
    return getMovies();
  }

  getMovies() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await ref.read(movieRepository).nowPlayingMovies(page: 1),
    );
  }
}

final nowPlayingMoviesProvider =
    AsyncNotifierProvider<NowPlayingMoviesNotifier, List<Movie>>(NowPlayingMoviesNotifier.new);
