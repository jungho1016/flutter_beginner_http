import '../dto/pixabay_result_dto.dart';
import '../model/photo.dart';

extension ToPhoto on Hits {
  Photo toPhoto() {
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
