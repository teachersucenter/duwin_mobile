import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: AspectRatio(
            aspectRatio: 539 / 114,
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list),
            )
          ],
        ),
      ),
    );
  }
}
