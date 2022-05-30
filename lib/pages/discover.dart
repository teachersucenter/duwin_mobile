import 'package:duwin/constants/colors.dart';
import 'package:duwin/widgets/duwin_book_card.dart';
import 'package:duwin/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'search_result.dart';
import 'package:duwin/result_layout.dart';

class Discover extends StatelessWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: duwinBlue,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Discover',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lorem Ipsum dolor sit amet, consetetur',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  SearchBar(
                    onPressed: (TextEditingController controller) {
                      final search = controller.text;
                      if (controller.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultLayout(
                                child: SearchResult(search: search),
                                title: 'Search'),
                          ),
                        );
                        controller.clear();
                      }
                    },
                  )
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: BrowseGenres(),
            ),
            const Expanded(
              flex: 3,
              child: BrowseBooks(),
            ),
          ],
        ),
      ),
    );
  }
}

class BrowseGenres extends StatelessWidget {
  const BrowseGenres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Browse All Genres',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, r) => AspectRatio(
              aspectRatio: 2 / 1,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 15.0),
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: const Text('Educational'),
              ),
            ),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}

class BrowseBooks extends StatefulWidget {
  const BrowseBooks({Key? key}) : super(key: key);

  @override
  _BrowseBooksState createState() => _BrowseBooksState();
}

class _BrowseBooksState extends State<BrowseBooks> {
  int _selected = 0;
  Map<String, String> bookType = {
    'Recommended': '',
    'Popular': '',
    'Recently': '',
    'Old': '',
  };

  @override
  Widget build(BuildContext context) {
    final List<String> keys = bookType.keys.toList();
    return Column(
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            height: 40.0,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemBuilder: (context, i) => SizedBox(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.5,
                          color: _selected == i
                              ? Theme.of(context).colorScheme.primary
                              : iconUntoggled.withOpacity(0.5)),
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      primary: _selected == i ? Colors.black87 : iconUntoggled,
                    ),
                    onPressed: () {
                      setState(() {
                        _selected = i;
                      });
                    },
                    child: Text(
                      keys[i],
                      style: TextStyle(
                          fontWeight: _selected == i
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                ),
              ),
              itemCount: bookType.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: ListView.separated(
            separatorBuilder: (context, i) => const SizedBox(
              width: 20.0,
            ),
            itemBuilder: (context, i) => const DuwinBookCard(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
