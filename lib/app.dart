import 'package:flutter/material.dart';

import 'package:duwin/pages/collections.dart';
import 'package:duwin/pages/discover.dart';
import 'package:duwin/pages/profile.dart';
import 'package:duwin/pages/home.dart';

import 'package:duwin/utils/auth.dart';

class Duwin extends StatefulWidget {
  const Duwin({Key? key}) : super(key: key);

  @override
  State<Duwin> createState() => _DuwinState();
}

class _DuwinState extends State<Duwin> {
  int _index = 0;
  late final PageController controller;

  void _onTap(index) {
    setState(() {
      _index = index;
    });
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
    Auth().signIn();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: const [
            Home(),
            Discover(),
            DuwinCollections(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Setting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile')
        ],
        onTap: _onTap,
        currentIndex: _index,
      ),
    );
  }
}
