import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
      home: Scaffold(
          appBar: AppBar(
            title: Text('카운터'),
          ),
          body: Counter()),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final counterSubject = BehaviorSubject<int>();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              counterSubject.add(++counter);
            },
            child: Text('add'),
          ),
          StreamBuilder<int>(
            stream: counterSubject.stream,
            initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              } else {
                return Text(
                  'No Data',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
