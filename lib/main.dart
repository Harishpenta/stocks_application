import 'package:flutter/material.dart';
import 'package:stocks_aplication/ui/stock_list.dart';
import 'package:stocks_aplication/ui/stocks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stocks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Stocks(),
    );
  }
}
