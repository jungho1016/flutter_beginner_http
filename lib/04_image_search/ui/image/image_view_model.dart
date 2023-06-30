import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search/data/api/pixabay_api_model.dart';
import 'package:flutter_beginner/04_image_search/ui/image/image_state.dart';

class ImageViewModel with ChangeNotifier {
  PixabayApiModel pixabayApiModel = PixabayApiModel();
  ImageState _state = ImageState(imageList: []);

  ImageState get state => _state;

  Future<void> fetchImageList() async {
    final imageList = await pixabayApiModel.getImage();
    _state = state.copyWith(imageList: imageList);
    notifyListeners();
  }

  Future<void> searchImages(String query) async {
    final imageList = await pixabayApiModel.searchImages(query);
    _state = state.copyWith(imageList: imageList);
    notifyListeners();
  }
}
