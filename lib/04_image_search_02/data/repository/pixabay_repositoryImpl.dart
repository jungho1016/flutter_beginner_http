import 'package:flutter_beginner/04_image_search_02/data/api/pixabay_api.dart';
import 'package:flutter_beginner/04_image_search_02/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_02/data/repository/photo_repository.dart';

// class PixabayRepositoryImple implements PhotoRepository {
//   PixabayApi _api = PixabayApi();
//
//   @override
//   Future<List<Photo>> getPhoto(String query) async {
//     final resultDto = await _api.getPhoto(query);
//     if (resultDto.hits == null) {
//       return [];
//     }
//     return resultDto.hits!.map((e) => e.toPhoto()).toList();
//   }
// }
//
// void main() {
//   PixabayRepositoryImple repositoryImple = PixabayRepositoryImple();
//   print(repositoryImple._api);
// }

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
