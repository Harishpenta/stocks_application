import 'package:flutter/material.dart';
import 'package:stocks_aplication/model/stock_model.dart';
import 'package:stocks_aplication/ui/pagination.dart';
import 'package:stocks_aplication/ui/stock_list.dart';

import '../model/page_item_model.dart';

class Stocks extends StatefulWidget {
  const Stocks({Key? key}) : super(key: key);

  @override
  _StocksState createState() => _StocksState();
}

class _StocksState extends State<Stocks> {
  List<StockItem> stockListMain = [];
  List<StockItem> stockListDefault = [];
  List<PageIndexItem> pagesList = [];
  TextEditingController securitySearchController = TextEditingController();
  String sortType = "A";
  int pageIndexLength = 0;
  List<StockItem> _searchList = [];
  int _page = 0; // default page to 0
  final int _perPage = 10; // per page items you want to show
  List<List<StockItem>> stockListItemsPages = [];

  @override
  void initState() {
    super.initState();
    loadStockDetailsFromLocalJsonRepo();
  }

  setPages(int pageIndexLength) {
    setState(() {
      for (var i = 0; i < pageIndexLength; i++) {
        PageIndexItem pageIndexItem = PageIndexItem(i, false);
        pagesList.add(pageIndexItem);
      }
    });
  }

  //:TODO For Loading Stock Details From Json File
  loadStockDetailsFromLocalJsonRepo() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/repository/stocksApiResponse.json");
    // final jsonResult = jsonDecode(data); //latest Dart
    setState(() {
      stockListMain = stockDetailsFromJson(data);
      stockListDefault.addAll(stockListMain);
      _searchList.addAll(stockListDefault);
      stockListMain =
          stockListDefault.sublist((0 * _perPage), ((0 * _perPage) + _perPage));
      pagesList.clear();
      setPages(_searchList.length ~/ 10);
    });
    // debugPrint(jsonResult);
  }

  onSort() {
    List<StockItem> _tempList = [];
    _tempList.addAll(_searchList);
    setState(() {
      if (sortType == "A") {
        _tempList.sort((a, b) => a.faceValue.compareTo(b.faceValue));
      } else {
        _tempList.sort((a, b) => b.faceValue.compareTo(a.faceValue));
      }
      stockListMain.clear();
      stockListMain.addAll(_tempList);
    });
  }

  onSearch(String securityId) {
    _searchList = stockListDefault
        .where((element) =>
            element.securityId.toLowerCase().contains(securityId.toLowerCase()))
        .toList();
    // for (StockItem stockItem in stockListDefault) {
    //   if (stockItem.securityId
    //       .toLowerCase()
    //       .contains(securityId.toLowerCase())) {
    //     _tempList.add(stockItem);
    //   }
    // }
    setState(() {
      if (_searchList.isNotEmpty) {
        stockListMain.clear();
        // stockListMain.addAll(_tempList);
        pagesList.clear();
        if (_searchList.length < 10) {
          stockListMain = _searchList;
          setPages(1);
        } else {
          stockListMain =
              _searchList.sublist((0 * _perPage), ((0 * _perPage) + _perPage));
          setPages(_searchList.length ~/ 10);
        }
      }
    });
  }

  onPageIndexChangeCallBack(PageIndexItem pageItem) {
    setState(() {
      // List<StockItem> _tempList = [];
      // _tempList.addAll(_searchList);
      _page = pageItem.pageIndexPosition;
      stockListMain = _searchList.sublist(
          (_page * _perPage), ((_page * _perPage) + _perPage));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock List"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // : TODO  Search
          _searchHeaderWidget(),
          // : TODO  Filter
          // _searchHeaderWidget(),
          // : TODO  List
          StockList(
            stockList: stockListMain,
          ),
          Pagination(
            pagesList: pagesList,
            onPageIndexChangeCallBack: onPageIndexChangeCallBack,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (sortType == "A") {
            sortType = "D";
          } else {
            sortType = "A";
          }
          onSort();
        },
        tooltip: "Sort By Face Value",
        child: const Icon(Icons.sort),
      ),
    );
  }

  Widget _searchHeaderWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: securitySearchController,
        onChanged: (val) {
          onSearch(val);
        },
        decoration: const InputDecoration(
          hintText: "Search here..",
          border: InputBorder.none,
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  Widget _listHeaderWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: const [
          Text(
            "Search header",
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
