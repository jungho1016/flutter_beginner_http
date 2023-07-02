import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_01/data/model/photo.dart';
import 'package:flutter_beginner/04_image_search_01/data/repository/photo_repository_impl.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  PhotoRepositoryImple _repository = PhotoRepositoryImple();
  List<Photo> _photos = [];
  List<Photo> get photos => _photos;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fechImages(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _repository.getPhotos(query);
    _isLoading = false;
    notifyListeners();
  }
}
