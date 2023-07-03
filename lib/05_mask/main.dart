import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data/model/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Store> stores = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future fetch() async {
    setState(() {
      isLoading = true;
    });
    var url =
        'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';
    final responce = await http.get(Uri.parse(url));
    final Map<String, dynamic> jsonResult =
        jsonDecode(utf8.decode(responce.bodyBytes));
    final List<dynamic> jsonStores = jsonResult['stores'];

    setState(
      () {
        stores.clear();
        jsonStores.forEach((e) {
          stores.add(Store.fromJson(e));
          isLoading = false;
        });
      },
    );
    print('fetch 완료');

    print(stores.map((e) => Text(e.name)).toList()); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '마스크 재고 있는곳 : ${stores.where((e) => e.remainStat == 'plenty' || e.remainStat == 'some' || e.remainStat == 'few').length}곳'),
        actions: [IconButton(onPressed: fetch, icon: Icon(Icons.refresh))],
      ),
      body: isLoading
          ? loadingWidget()
          : ListView(
              children: stores
                  .where((e) =>
                      e.remainStat == 'plenty' ||
                      e.remainStat == 'some' ||
                      e.remainStat == 'few')
                  .map((e) {
                return ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.addr),
                  trailing: _buildRemainStat(e),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildRemainStat(Store store) {
    String remainStat = '판매중지';
    String description = '판매중지';
    Color color = Colors.black;
    switch (store.remainStat) {
      case 'plenty':
        remainStat = '충분';
        description = '100개 이상';
        color = Colors.green;
        break;
      case 'some':
        remainStat = '보통';
        description = '30 ~ 100개';
        color = Colors.yellow;
        break;
      case 'few':
        remainStat = '부족';
        description = '2개 ~ 30개';
        color = Colors.red;
        break;
      case 'empty':
        remainStat = '소진 임박';
        description = '1개 이하';
        color = Colors.grey;
        break;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          remainStat,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(color: color),
        )
      ],
    );
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('정보를 가져 오는 중'), CircularProgressIndicator()],
      ),
    );
  }
}
