import 'package:flutter_beginner/04_image_search_02/data/api/pixabay_api.dart';
import 'package:flutter_beginner/04_image_search_02/data/mapper/pixabay_mapper.dart';
import 'package:flutter_beginner/04_image_search_02/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_02/data/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhoto(String query) async {
    final resultDto = await _api.getPhoto(query);

    if (resultDto.hits == null) {
      return [];
    }

    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}

void main() async {
  PixabayPhotoRepositoryImpl pixabayPhotoRepositoryImpl =
      PixabayPhotoRepositoryImpl();
  pixabayPhotoRepositoryImpl.getPhoto('바나나');
}
