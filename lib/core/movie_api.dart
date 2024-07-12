import 'package:dio/dio.dart';
import 'package:movie_app/core/movie_model.dart';

class MovieApi {
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.omdbapi.com?apikey=e141d9a6',
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
    ),
  );

  Future<List<MovieModel>> search({
    required String text,
    required int page,
  }) async {
    final response = await _dio.get("&s=$text&page=$page");
    final List<dynamic> list = response.data['Search'] ?? [];
    return list.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<MovieModel> details({required String id}) async {
    final response = await _dio.get("&i=$id");
    return MovieModel.fromJson(response.data);
  }
}
