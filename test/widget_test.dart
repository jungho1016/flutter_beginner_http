// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:flutter_beginner/01_misae/model/air_result.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http 통신 테스트', () async {
    final http.Response response = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=efdac9c1-9025-465c-8295-881319e8d497'));
  });
}
