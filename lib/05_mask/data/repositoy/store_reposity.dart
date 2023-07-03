import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../model/model.dart';

class StoreRepository {
  Future<List<Store>> fetch(double latitude, double longitude) async {
    bool isLoading = false;
    List<Store> stores = [];
    final Distance distance = new Distance();

    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';

    try {
      final responce = await http.get(Uri.parse(url));

      if (responce.statusCode == 200) {
        final Map<String, dynamic> jsonResult =
            jsonDecode(utf8.decode(responce.bodyBytes));
        final List<dynamic> jsonStores = jsonResult['stores'];

        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final km = distance.as(LengthUnit.Kilometer,
              LatLng(store.lat, store.lng), LatLng(latitude, longitude));
          store.km = km;
          stores.add(store);
        });
        print('fetch 완료');

        return stores
            .where((e) =>
                e.remainStat == 'plenty' ||
                e.remainStat == 'some' ||
                e.remainStat == 'few')
            .toList()
          ..sort((a, b) => a.km!.compareTo(b.km!));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
