import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/configs/dio_provider.dart';
import '../../discover/domain/movie_filter_params.dart';
import '../../home/domain/movie_model.dart';

class SearchMovieRepository {
  final Dio dio;

  SearchMovieRepository(this.dio);

  /// [searchMovie] digunakan untuk mengambil list movie dengan search bar
  Future<List<Movie>> searchMovie({
    required int page,
    String query = '',
    MovieFilterParams? params,
  }) async {
    try {
      const String path = 'search/movie';
      final Response response = await dio.get(
        path,
        queryParameters: {
          "page": page,
          "query": query,
          if (params != null) ...params.toJson(),
        },
      );

      if (response.statusCode == 200) {
        final MoviesWithPagination moviesWithPagination = MoviesWithPagination.fromJson(response.data);
        final List<Movie> result = moviesWithPagination.results;
        return result;
      }
      return [];
    } on DioException catch (_) {
      rethrow;
    }
  }
}

final searchMovieRepository = Provider<SearchMovieRepository>((ref) {
  final Dio dio = ref.watch(dioProvider);
  return SearchMovieRepository(dio);
});
