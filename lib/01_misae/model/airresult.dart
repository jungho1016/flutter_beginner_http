class AirResult {
  AirResult({
    required this.status,
    required this.data,
  });

  final String status;
  final Data data;

  AirResult.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        data = Data.fromJson(json['data']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  final String city;
  final String state;
  final String country;
  final Location location;
  final Current current;

  Data.fromJson(Map<String, dynamic> json)
      : city = json['city'],
        state = json['state'],
        country = json['country'],
        location = Location.fromJson(json['location']),
        current = Current.fromJson(json['current']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  final String type;
  final List<double> coordinates;

  Location.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        coordinates = List.castFrom<dynamic, double>(json['coordinates']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    return _data;
  }
}

class Current {
  Current({
    required this.pollution,
    required this.weather,
  });

  final Pollution pollution;
  final Weather weather;

  Current.fromJson(Map<String, dynamic> json)
      : pollution = Pollution.fromJson(json['pollution']),
        weather = Weather.fromJson(json['weather']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pollution'] = pollution.toJson();
    _data['weather'] = weather.toJson();
    return _data;
  }
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  final String ts;
  final int aqius;
  final String mainus;
  final int aqicn;
  final String maincn;

  Pollution.fromJson(Map<String, dynamic> json)
      : ts = json['ts'],
        aqius = json['aqius'],
        mainus = json['mainus'],
        aqicn = json['aqicn'],
        maincn = json['maincn'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ts'] = ts;
    _data['aqius'] = aqius;
    _data['mainus'] = mainus;
    _data['aqicn'] = aqicn;
    _data['maincn'] = maincn;
    return _data;
  }
}

class Weather {
  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  final String ts;
  final int tp;
  final int pr;
  final int hu;
  final double ws;
  final int wd;
  final String ic;

  Weather.fromJson(Map<String, dynamic> json)
      : ts = json['ts'],
        tp = json['tp'],
        pr = json['pr'],
        hu = json['hu'],
        ws = json['ws'],
        wd = json['wd'],
        ic = json['ic'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ts'] = ts;
    _data['tp'] = tp;
    _data['pr'] = pr;
    _data['hu'] = hu;
    _data['ws'] = ws;
    _data['wd'] = wd;
    _data['ic'] = ic;
    return _data;
  }
}
