import 'package:flutter_beginner/04_image_search_02/data/dto/PixabayResultDto.dart';
import 'package:flutter_beginner/04_image_search_02/data/model/photo.dart';

extension ToPhoto on Hits {
  Photo tophoto() {
    return Photo(
        id: id ?? 0,
        type: type ?? '',
        webformatURL: webformatURL ?? '',
        views: views ?? 0,
        downloads: downloads ?? 0,
        collections: collections ?? 0,
        likes: likes ?? 0,
        comments: comments ?? 0,
        user: user ?? '',
        userImageURL: userImageURL ?? '',
        tags: tags ?? '');
  }
}
