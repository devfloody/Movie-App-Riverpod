import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';

import '../../../home/domain/movie_model.dart';
import '../../data/search_movie_repository.dart';
import 'query_provider.dart';

class SearchMoviePaginationNotifier extends PagedNotifier<int, Movie> {
  final SearchMovieRepository repository;
  String query;

  SearchMoviePaginationNotifier(this.repository, this.query)
      : super(
          load: (page, limit) async {
            return await repository.searchMovie(page: page, query: query);
          },
          nextPageKeyBuilder: NextPageKeyBuilderDefault.mysqlPagination,
        );
}

final searchMovieNotifierProvider = StateNotifierProvider<SearchMoviePaginationNotifier, PagedState<int, Movie>>((ref) {
  final SearchMovieRepository repository = ref.watch(searchMovieRepository);
  final String query = ref.watch(queryProvider);
  return SearchMoviePaginationNotifier(repository, query);
});
