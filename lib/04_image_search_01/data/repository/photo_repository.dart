import 'package:flutter_beginner/04_image_search_01/data/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(String query);
}
