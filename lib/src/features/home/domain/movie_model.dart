import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MoviesWithPagination with _$MoviesWithPagination {
  const factory MoviesWithPagination({
    required int page,
    required List<Movie> results,
    @JsonKey(name: "total_pages") required int totalPages,
    @JsonKey(name: "total_results") required int totalResults,
  }) = _MoviesWithPagination;

  factory MoviesWithPagination.fromJson(Map<String, dynamic> json) => _$MoviesWithPaginationFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    bool? adult,
    @JsonKey(name: "backdrop_path") String? backdropPath,
    int? id,
    @JsonKey(name: "original_title")  String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: "poster_path")  String? posterPath,
    @JsonKey(name: "release_date") String? releaseDate,
    String? title,
    @JsonKey(name: "vote_average") double? voteAverage,
    @JsonKey(name: "vote_count") int? voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
