import 'package:flutter/material.dart';
import 'package:duwin/constants/colors.dart';

class DuwinBookCard extends StatelessWidget {
  const DuwinBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('Hello');
      },
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.blueGrey),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Queen',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'by Jhon Smith',
                    style: TextStyle(color: iconUntoggled),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
