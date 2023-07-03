import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class StoreRepository {
  Future<List<Store>> fetch() async {
    bool isLoading = false;
    List<Store> stores = [];

    // setState(() {
    //   isLoading = true;
    // });
    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';
    final responce = await http.get(Uri.parse(url));
    final Map<String, dynamic> jsonResult =
        jsonDecode(utf8.decode(responce.bodyBytes));
    final List<dynamic> jsonStores = jsonResult['stores'];

    // setState(
    //   () {
    jsonStores.forEach((e) {
      stores.add(Store.fromJson(e));
      isLoading = false;
    });
    //   },
    // );
    print('fetch 완료');

    return stores
        .where((e) =>
            e.remainStat == 'plenty' ||
            e.remainStat == 'some' ||
            e.remainStat == 'few')
        .toList();
  }
}
