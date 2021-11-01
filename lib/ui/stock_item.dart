import 'package:flutter/material.dart';
import 'package:stocks_aplication/model/stock_model.dart';

class StockItemScreen extends StatefulWidget {
  final StockItem stockItem;
  final int position;

  const StockItemScreen(
      {Key? key, required this.stockItem, required this.position})
      : super(key: key);

  @override
  _StockItemScreenState createState() => _StockItemScreenState();
}

class _StockItemScreenState extends State<StockItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.position % 2 == 0
          ? Colors.white
          : Colors.black.withOpacity(0.05),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.stockItem.securityName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleWidget("Security ID", widget.stockItem.securityId),
                    titleWidget(
                        "Face Value", widget.stockItem.faceValue.toString())
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWidget(String title, String value,
      {CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FittedBox(
          child: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          value,
          style: const TextStyle(color: Color(0xff26415B), fontSize: 12),
        )
      ],
    );
  }
}
