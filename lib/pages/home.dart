import 'package:duwin/pages/generic_list.dart';
import 'package:duwin/widgets/duwinRoundedBtn.dart';
import 'package:flutter/material.dart';
import 'package:duwin/constants/colors.dart';
import 'package:duwin/widgets/duwin_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final images = ['', '', ''];

  int selected = 0;

  late final PageController _pageController;
  int activeImage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: images.length ~/ 2);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPressed(int num) {
    setState(() {
      selected = num;
    });
  }

  List<Widget> indicators(length, curIndex) {
    return List<Widget>.generate(
      length,
      (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: curIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.5),
              shape: BoxShape.circle),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> iconList = [
      {'title': 'All', 'icon': Icons.book},
      {'title': 'Popular', 'icon': Icons.favorite_border},
      {'title': 'New Books', 'icon': Icons.access_time},
      {'title': 'Reading list', 'icon': Icons.bookmark},
    ];

    return SingleChildScrollView(
      child: Material(
        color: duwinBlue,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText('Hi James,'),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Explore Books',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Flexible(
                child: AspectRatio(
                  aspectRatio: 1.5 / 1,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activeImage = page;
                      });
                    },
                    itemBuilder: (context, i) => Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        color: Colors.blueGrey,
                      ),
                      margin: const EdgeInsets.all(10.0),
                    ),
                    itemCount: images.length,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activeImage),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: iconList
                    .asMap()
                    .entries
                    .map(
                      (e) => Column(
                        children: [
                          DuwinRoundedBtn(
                            val: e.key,
                            onPressed: onPressed,
                            icon: e.value['icon'] as IconData,
                            selected: selected == e.key,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              e.value['title'] as String,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
              IndexedStack(
                index: selected,
                children: iconList
                    .map(
                      (e) => DuwinList(
                        title: e['title'],
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GenericList(
                                title: e['title'],
                                bookAuthorList: [],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
