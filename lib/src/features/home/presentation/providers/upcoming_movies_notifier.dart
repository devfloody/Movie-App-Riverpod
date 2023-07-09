import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../home/domain/movie_model.dart';
import '../../data/movie_repository.dart';

class UpcomingMoviesNotifier extends AsyncNotifier<List<Movie>> {
  @override
  FutureOr<List<Movie>> build() {
    return getMovies();
  }

  getMovies() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => await ref.read(movieRepository).upcomingMovies(page: 1),
    );
  }
}

final upcomingMoviesProvider = AsyncNotifierProvider<UpcomingMoviesNotifier, List<Movie>>(UpcomingMoviesNotifier.new);
