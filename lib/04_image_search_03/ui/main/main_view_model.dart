import 'package:flutter/material.dart';
import 'package:flutter_beginner/04_image_search_03/data/repository/photo_repository.dart';

import 'main_state.dart';

class MainViewModel with ChangeNotifier {
  final PhotoRepository _repository;
  MainViewModel(this._repository);
  MainState _state = const MainState();
  MainState get state => _state;

  Future<void> fetchImages(String query) async {
    _state.copyWith(isLoading: true);
    notifyListeners();

    final photos = await _repository.getPhoto(query);
    _state.copyWith(isLoading: true, photos: photos);
    notifyListeners();
  }
}
