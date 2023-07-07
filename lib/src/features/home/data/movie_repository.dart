import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/configs/dio_provider.dart';
import '../../home/domain/movie_model.dart';

class MovieRepository {
  final Dio dio;

  MovieRepository(this.dio);

  /// Fetch Now Playing Movies
  Future<List<Movie>> nowPlayingMovies({required int page}) async {
    try {
      const String path = 'movie/now_playing';

      final Response response = await dio.get(
        path,
        queryParameters: {
          "page": page,
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

  /// Fetch Popular Movies
  Future<List<Movie>> popularMovies({required int page}) async {
    try {
      const String path = 'movie/popular';

      final Response response = await dio.get(
        path,
        queryParameters: {
          "page": page,
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

  /// Fetch Upcoming Movies
  Future<List<Movie>> upcomingMovies({required int page}) async {
    try {
      const String path = 'movie/top_rated';

      final Response response = await dio.get(
        path,
        queryParameters: {
          "page": page,
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

final movieRepository = Provider<MovieRepository>((ref) {
  final Dio dio = ref.watch(dioProvider);
  return MovieRepository(dio);
});
