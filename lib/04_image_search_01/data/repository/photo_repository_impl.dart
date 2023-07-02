import 'package:flutter_beginner/04_image_search_01/data/api/pixabay_api.dart';
import 'package:flutter_beginner/04_image_search_01/data/dto/pixabay_result_dto.dart';
import 'package:flutter_beginner/04_image_search_01/data/mapper/pixabay_mapper.dart';
import 'package:flutter_beginner/04_image_search_01/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_01/data/repository/photo_repository.dart';

class PhotoRepositoryImple implements PhotoRepository {
  PixbayApi _api = PixbayApi();
  @override
  Future<List<Photo>> getPhotos(String query) async {
    final PixabayResultDto resultDto = await _api.getImages(query);
    if (resultDto.hits == null) {
      return [];
    }
    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
