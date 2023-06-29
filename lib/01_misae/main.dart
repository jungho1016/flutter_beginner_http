import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_beginner/01_misae/bloc/air_bloc.dart';
import 'package:http/http.dart' as http;

import 'model/air_result.dart';

void main() {
  runApp(const MyApp());
}

final airBloc = AirBloc();

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
  @override
  void initState() {
    super.initState();
    airBloc.fetch(); // airBloc을 통해 데이터를 가져오는 메소드 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<AirResult>(
              stream: airBloc.airResult,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return buildBody(
                      snapshot.data!); // 데이터가 있는 경우 buildBody 함수 호출
                } else if (snapshot.hasError) {
                  return Text(
                      'Error: ${snapshot.error}'); // 에러가 있는 경우 에러 메시지 표시
                } else {
                  return CircularProgressIndicator(); // 데이터를 기다리는 동안 로딩 인디케이터 표시
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                airBloc.fetch();
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBody(AirResult _result) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    ]),
  );
}
