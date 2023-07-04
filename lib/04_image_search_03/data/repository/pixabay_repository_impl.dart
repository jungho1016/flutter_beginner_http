import 'package:flutter_beginner/04_image_search_03/data/api/pixabay_api.dart';
import 'package:flutter_beginner/04_image_search_03/data/mapper/pixabay_mapper.dart';
import 'package:flutter_beginner/04_image_search_03/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_03/data/repository/photo_repository.dart';

import '../dto/pixabay_result_dto.dart';

class PixabayResposityImple implements PhotoRepository {
  @override
  Future<List<Photo>> getPhoto(String query) async {
    final PixabayApi _api = PixabayApi();
    final PixabayResultDto resultDto = await _api.getApi(query);
    return resultDto.hits.map((e) => e.tophoto()).toList();
  }
}
