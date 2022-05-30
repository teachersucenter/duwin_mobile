import 'package:flutter/material.dart';
import 'package:duwin/widgets/duwin_list_tile.dart';
import 'package:duwin/constants/colors.dart';

class DuwinList extends StatefulWidget {
  final String title;
  final Function onPressed;

  const DuwinList({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  _DuwinListState createState() => _DuwinListState();
}

class _DuwinListState extends State<DuwinList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => widget.onPressed(),
              child: const Text(
                'View All',
                style: TextStyle(color: iconUntoggled),
              ),
            ),
          ],
        ),
        _buildBooks(),
      ],
    );
  }

  Widget _buildBooks() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        //TODO Apply logic for paginatiom
        return _buildRow(i);
      },
      separatorBuilder: (context, i) => const SizedBox(
        height: 10.0,
      ),
      itemCount: 4,
    );
  }

  Widget _buildRow(int i) {
    return const DuwinListTile(
      title: 'Queen Bae',
      subtitle: 'by Jhon Smith',
    );
  }
}
