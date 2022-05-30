import 'package:duwin/constants/colors.dart';
import 'package:duwin/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/duwin_list.dart';

class SearchResult extends StatefulWidget {
  final String? search;
  const SearchResult({Key? key, this.search}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(
            onPressed: (TextEditingController controller) {},
            search: widget.search,
          ),
          DuwinList(
            onPressed: () {},
            title: 'Top Result',
          ),
          DuwinList(title: 'Books', onPressed: () {})
        ],
      ),
    );
  }
}
