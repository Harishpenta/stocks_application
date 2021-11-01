import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocks_aplication/ui/stock_item.dart';

import '../model/stock_model.dart';

class StockList extends StatefulWidget {
  final List<StockItem> stockList;

  const StockList({Key? key, required this.stockList}) : super(key: key);

  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  void initState() {
    super.initState();
    // pageIndexLength = stockListMain.length ~/ 10;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.stockList.length,
          itemBuilder: (context, i) {
            return StockItemScreen(
              position: i,
              stockItem: widget.stockList[i],
            );
          }),
    );
  }
}
