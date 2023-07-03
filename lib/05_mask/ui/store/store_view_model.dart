import 'package:flutter/material.dart';
import 'package:flutter_beginner/05_mask/data/repositoy/store_reposity.dart';

import '../../data/model/model.dart';

class StoreViewModel with ChangeNotifier {
  bool isLoading = false;
  List<Store> stores = [];
  final StoreRepository _storeRepository = StoreRepository();

  StoreViewModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();
    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}
