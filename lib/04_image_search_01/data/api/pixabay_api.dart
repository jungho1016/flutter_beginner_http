import 'dart:convert';
import 'package:flutter_beginner/04_image_search_01/data/dto/pixabay_result_dto.dart';
import 'package:http/http.dart' as http;

import '../repository/photo_repository_impl.dart';

class PixbayApi {
  Future<PixabayResultDto> getImages(String query) async {
    final url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&${query}';
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonString = jsonDecode(response.body);
    return PixabayResultDto.fromJson(jsonString);
  }
}
