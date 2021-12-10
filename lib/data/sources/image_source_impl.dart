import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:pinterest_clone/domain/entities/get_images_request.dart';
import 'package:pinterest_clone/data/utils/safe_result.dart';
import 'package:pinterest_clone/domain/entities/get_images_response.dart';
import 'package:pinterest_clone/domain/entities/get_random_images_response.dart';
import 'package:pinterest_clone/domain/sources/image_source.dart';

class ImageSourceImpl implements ImageSource {
  final BASE_URL = 'api.unsplash.com';
  final GET_IMAGES_BY_KEYWORD_END_POINT = 'search/photos';
  final CLIENT_ID = 'client_id';
  final QUERY = 'query';
  final PAGE = 'page';
  final PER_PAGE = 'per_page';
  final ACCESS_KEY = '-LJnsYf8JKKXtcpLyAhomxk_hCbYuaCBEA5Sl_jM1kc';
  final GET_RANDOM_IMAGES_END_POINT = 'photos/random';
  final COUNT = 'count';

  @override
  Future<SafeResult<GetImagesResponse>> getImagesByKeyword(
      GetImagesRequest getImagesRequest) async {
    var uri = Uri.http(BASE_URL, GET_IMAGES_BY_KEYWORD_END_POINT, {
      CLIENT_ID: ACCESS_KEY,
      QUERY: getImagesRequest.query,
      PAGE: getImagesRequest.page,
      PER_PAGE: getImagesRequest.perPage
    });
    try {
      var response = await get(uri);
      print(response.body);
      return SafeResult.success(
          GetImagesResponse.fromJson(jsonDecode(response.body)));
    } on SocketException {
      return SafeResult.failure(Exception('No Internet Connection'));
    } catch (err) {
      return SafeResult.failure(Exception('Something went wrong'));
    }
  }

  @override
  Future<SafeResult<List<GetRandomImagesResponse>>> getRandomImages(int count) async {
    var uri = Uri.http(BASE_URL, GET_RANDOM_IMAGES_END_POINT,
        {CLIENT_ID: ACCESS_KEY, COUNT: count.toString()});
    try {
      var response = await get(uri);
      print(response.body);
      final json = jsonDecode(response.body);
      final list = List.from(json).map((e)=>GetRandomImagesResponse.fromJson(e)).toList();
      return SafeResult.success(list);
    } on SocketException {
      return SafeResult.failure(Exception('No Internet Connection'));
    } catch (err) {
      return SafeResult.failure(Exception('Something went wrong'));
    }
  }
}
