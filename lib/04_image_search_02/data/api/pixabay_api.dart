import 'dart:convert';

import 'package:flutter_beginner/04_image_search_02/data/dto/PixabayResultDto.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  Future getPhoto(String query) async {
    final url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&${query}';
    final http.Response response = await http.get(Uri.parse(url));
    final jsonString = jsonDecode(response.body);
    return PixabayResultDto.fromJson(jsonString);
  }
}

void main() {
  PixabayApi pixabayApi = PixabayApi();
  print(pixabayApi.getPhoto('바나나'));
}
