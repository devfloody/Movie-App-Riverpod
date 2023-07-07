import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:new_movie_riverpod/src/core/configs/env/env.dart';
import 'package:new_movie_riverpod/src/core/constants/api_constant.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      responseType: ResponseType.json,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 5),
      headers: {
        "Authorization": "Bearer ${Env.apiToken}",
      },
    ),
  );
  return dio;
});
