class MovieFilterParams {
  final bool? includeAdult;
  final String? region;
  final String? year;
  final String? language;

  MovieFilterParams({
    this.includeAdult,
    this.region,
    this.year,
    this.language,
  });

  Map<String, dynamic> toJson() {
    return {
      'include_adult': includeAdult ?? false,
      'region': region ?? '',
      'year': year ?? '',
      'language': language ?? 'en-US',
    };
  }

  factory MovieFilterParams.fromJson(Map<String, dynamic> json) {
    return MovieFilterParams(
      includeAdult: json['include_adult'],
      region: json['region'],
      year: json['year'],
      language: json['language'],
    );
  }
}
