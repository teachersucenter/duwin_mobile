import 'package:duwin/constants/colors.dart';
import 'package:duwin/widgets/duwin_book_card.dart';
import 'package:flutter/material.dart';

class DuwinCollections extends StatelessWidget {
  const DuwinCollections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: duwinBlue,
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('My Collections'),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ['Favorite', () {}],
                        ['Reading List', () {}],
                        ['Downloaded', () {}]
                      ]
                          .map(
                            (e) => ListTile(
                              tileColor: Colors.white,
                              onTap: e[1] as VoidCallback,
                              leading: Text(e[0] as String),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 12.0,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Activity',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () => () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(color: iconUntoggled),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => const DuwinBookCard(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
