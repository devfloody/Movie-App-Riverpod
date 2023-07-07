import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/configs/dio_provider.dart';
import '../../home/domain/movie_model.dart';
import '../domain/movie_filter_params.dart';

/// [DiscoverMovieRepository] digunakan untuk mengambil data movie dari api
class DiscoverMovieRepository {
  final Dio dio;

  DiscoverMovieRepository(this.dio);

  /// [discoverMovies] digunakan untuk mengambil list movie yang sekarang sedang tayang
  Future<List<Movie>> discoverMovies({
    required int page,
    MovieFilterParams? params,
  }) async {
    try {
      const String path = 'discover/movie';

      final Response response = await dio.get(
        path,
        queryParameters: {
          "page": page,
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

final discoverMovieRepository = Provider<DiscoverMovieRepository>((ref) {
  final Dio dio = ref.watch(dioProvider);
  return DiscoverMovieRepository(dio);
});
