import 'package:duwin/result_layout.dart';
import 'package:duwin/widgets/duwin_list_tile.dart';
import 'package:flutter/material.dart';

class GenericList extends StatefulWidget {
  final String title;
  final dynamic bookAuthorList;
  const GenericList(
      {Key? key, required this.title, required this.bookAuthorList})
      : super(key: key);

  @override
  _GenericListState createState() => _GenericListState();
}

class _GenericListState extends State<GenericList> {
  @override
  Widget build(BuildContext context) {
    return ResultLayout(
        child: ListView.builder(
          itemBuilder: (context, i) => i.isOdd
              ? SizedBox(
                  height: 10.0,
                )
              : DuwinListTile(title: 'Queen Bae', subtitle: 'By John'),
        ),
        title: widget.title);
  }
}
