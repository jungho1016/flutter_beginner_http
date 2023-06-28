import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '01_misae/model/airresult.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple, // Set the primary color swatch
        ),
      ),
      home: const Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  late AirResult _result;

  Future<AirResult> fetchData() async {
    final http.Response response = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=efdac9c1-9025-465c-8295-881319e8d497'));

    final jsonString = jsonDecode(response.body);
    AirResult result = AirResult.fromJson(jsonString);

    return result;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '현재 위치 미세먼지',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('얼굴 사진'),
                                  Text(
                                    '${_result.data.current.pollution.aqius}',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  Text(
                                    '보통',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              color: Colors.yellow),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text('이미지'),
                                    Text('${_result.data.current.weather.tp}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('습도'),
                                    Text('${_result.data.current.weather.hu}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('풍속'),
                                    Text('${_result.data.current.weather.ws}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        backgroundColor:
                            Colors.orange, // Set the button background color
                      ),
                      child: Icon(
                        Icons.refresh,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
