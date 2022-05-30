import 'package:duwin/pages/book_detail.dart';
import 'package:duwin/result_layout.dart';
import 'package:flutter/material.dart';

class DuwinListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const DuwinListTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      leading: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildButton(Icons.favorite, () {}),
          const SizedBox(
            width: 18.0,
          ),
          _buildButton(Icons.add, () {})
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ResultLayout(child: BookDetail(), title: 'Queenie')));
      },
    );
  }

  Widget _buildButton(IconData icon, void Function()? onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.square(50.0),
        maximumSize: const Size.square(100.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
