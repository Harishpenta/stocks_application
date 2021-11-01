import 'package:flutter/material.dart';
import 'package:stocks_aplication/model/page_item_model.dart';
import 'package:stocks_aplication/ui/page_index_item.dart';

class Pagination extends StatefulWidget {
  final List<PageIndexItem> pagesList;
  final Function onPageIndexChangeCallBack;

  const Pagination(
      {Key? key,
      required this.pagesList,
      required this.onPageIndexChangeCallBack})
      : super(key: key);

  @override
  _PaginationState createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  void didUpdateWidget(covariant Pagination oldWidget) {
    if (widget.pagesList.length == 1) {
      widget.pagesList[0].isSelected = true;
    } else {
      if (widget.pagesList.isNotEmpty) {
        List<PageIndexItem> selectedItems = widget.pagesList
            .where((element) => element.isSelected == true)
            .toList();
        if (selectedItems.isEmpty) {
          widget.pagesList[0].isSelected = true;
        }
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  onPageIndexClickCallBack(PageIndexItem pageItem) {
    setState(() {
      for (var i = 0; i < widget.pagesList.length; i++) {
        if (pageItem.pageIndexPosition ==
            widget.pagesList[i].pageIndexPosition) {
          widget.pagesList[i].isSelected = pageItem.isSelected;
        } else {
          widget.pagesList[i].isSelected = false;
        }
      }
      widget.onPageIndexChangeCallBack(pageItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.pagesList.isNotEmpty
        ? SizedBox(
            height: 50,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.pagesList.length,
                itemBuilder: (context, i) {
                  return PageIndexItemScreen(
                    pageIndexItem: widget.pagesList[i],
                    onPageIndexClickCallBack: onPageIndexClickCallBack,
                  );
                }),
          )
        : Container();
  }
}
