import 'dart:convert';

import '../model/air_result.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _airSubject = BehaviorSubject<AirResult>();

  Future<AirResult> fetchData() async {
    final http.Response response = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=efdac9c1-9025-465c-8295-881319e8d497'));

    final jsonString = jsonDecode(response.body);
    AirResult result = AirResult.fromJson(jsonString);

    return result;
  }

  void fetch() async {
    var airResult = await fetchData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult => _airSubject.stream;
}
