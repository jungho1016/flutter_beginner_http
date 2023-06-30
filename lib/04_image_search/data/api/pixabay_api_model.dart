import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/image_model.dart';

class PixabayApiModel {
  Future<List<ImageModel>> getImage() async {
    final url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=yellow+flowers&image_type=photo&pretty=true';
    final http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonString = jsonDecode(response.body);
    List<dynamic> jsonHits = jsonString['hits'];
    return jsonHits.map((e) => ImageModel.fromJson(e)).toList();
  }

  Future<List<ImageModel>> searchImages(String query) async {
    final url =
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo&pretty=true';
    final http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonString = jsonDecode(response.body);
    List<dynamic> jsonHits = jsonString['hits'];
    return jsonHits.map((e) => ImageModel.fromJson(e)).toList();
  }
}
