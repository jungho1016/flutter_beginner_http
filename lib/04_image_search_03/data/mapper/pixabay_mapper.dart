import 'package:flutter_beginner/04_image_search_03/data/dto/pixabay_result_dto.dart';

import '../model/photo.dart';

extension ToPhoto on Hits {
  Photo tophoto() {
    return Photo(
        id: id ?? 0,
        webformatURL: webformatURL ?? '',
        tags: tags ?? '',
        likes: likes ?? 0);
  }
}
