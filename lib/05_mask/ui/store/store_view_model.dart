import 'package:flutter/material.dart';
import 'package:flutter_beginner/05_mask/data/repositoy/store_reposity.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/model/model.dart';
import '../../data/repositoy/location_reposity.dart';

class StoreViewModel with ChangeNotifier {
  bool isLoading = false;
  List<Store> stores = [];
  final StoreRepository _storeRepository = StoreRepository();
  final LocationRepository _locationRepository = LocationRepository();

  StoreViewModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    _locationRepository.determinePosition();
    Position position = await _locationRepository.getCurrenLocation();
    stores =
        await _storeRepository.fetch(position.latitude, position.longitude);

    isLoading = false;
    notifyListeners();
  }
}
