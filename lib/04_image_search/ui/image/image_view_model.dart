import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search/data/api/pixabay_api_model.dart';

import '../../model/image_model.dart';

class ImageViewModel with ChangeNotifier {
  PixabayApiModel pixabayApiModel = PixabayApiModel();
  List<ImageModel> imageList = [];

  Future<void> fetchImageList() async {
    List<ImageModel> list = await pixabayApiModel.getImage();
    imageList = list;
    notifyListeners();
  }

  Future<void> searchImages(String query) async {
    List<ImageModel> list = await pixabayApiModel.searchImages(query);
    imageList = list;
    notifyListeners();
  }
}
