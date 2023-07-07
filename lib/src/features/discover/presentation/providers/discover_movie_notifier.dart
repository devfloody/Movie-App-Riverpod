import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

import '../../../home/domain/movie_model.dart';
import '../../data/discover_movie_repository.dart';

class DiscoverMoviePaginationNotifier extends PagedNotifier<int, Movie> {
  final DiscoverMovieRepository repository;

  DiscoverMoviePaginationNotifier(this.repository)
      : super(
          load: (page, limit) async {
            return await repository.discoverMovies(page: page);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
          errorBuilder: (error) {
            return 'Page Error 404';
          },
        );
}

final discoverMovieNotifierProvider =
    StateNotifierProvider<DiscoverMoviePaginationNotifier, PagedState<int, Movie>>((ref) {
  final DiscoverMovieRepository repository = ref.watch(discoverMovieRepository);
  return DiscoverMoviePaginationNotifier(repository);
});
