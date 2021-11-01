import 'package:flutter/material.dart';

import '../model/page_item_model.dart';

class PageIndexItemScreen extends StatefulWidget {
  final PageIndexItem pageIndexItem;
  final Function onPageIndexClickCallBack;
  final bool isFirstItemSelected;

  const PageIndexItemScreen(
      {Key? key,
      required this.pageIndexItem,
      required this.onPageIndexClickCallBack,
      this.isFirstItemSelected = true})
      : super(key: key);

  @override
  _PageIndexItemScreenState createState() => _PageIndexItemScreenState();
}

class _PageIndexItemScreenState extends State<PageIndexItemScreen> {
  // @override
  // void didUpdateWidget(covariant PageIndexItemScreen oldWidget) {
  //   if (widget.isFirstItemSelected) {
  //     PageIndexItem pageIndexItem = PageIndexItem(0, true);
  //     widget.onPageIndexClickCallBack(pageIndexItem);
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    // if (widget.isFirstItemSelected) {
    //   PageIndexItem pageIndexItem = PageIndexItem(0, true);
    //   widget.onPageIndexClickCallBack(pageIndexItem);
    // }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (widget.pageIndexItem.isSelected) {
            // widget.pageIndexItem.isSelected = false;
          } else {
            widget.pageIndexItem.isSelected = true;
            widget.onPageIndexClickCallBack(widget.pageIndexItem);
          }
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: widget.pageIndexItem.isSelected
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 0),
                    blurRadius: 0)
              ]),
          padding: const EdgeInsets.all(10),
          child: FittedBox(
            child: Text(
              (widget.pageIndexItem.pageIndexPosition + 1).toString(),
              style: TextStyle(
                  color: widget.pageIndexItem.isSelected
                      ? Colors.white
                      : Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
