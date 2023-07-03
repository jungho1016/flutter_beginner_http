import 'package:flutter_beginner/04_image_search_02/data/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhoto(String query);
}
