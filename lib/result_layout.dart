import 'package:duwin/constants/colors.dart';
import 'package:flutter/material.dart';

class ResultLayout extends StatelessWidget {
  final Widget child;
  final String title;
  const ResultLayout({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      backgroundColor: duwinBlue,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: child,
      ),
    );
  }
}
