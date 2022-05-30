import 'package:flutter/material.dart';
import 'package:duwin/constants/colors.dart';

class DuwinRoundedBtn extends StatefulWidget {
  final Function onPressed;
  final IconData icon;
  final bool selected;
  final val;

  const DuwinRoundedBtn(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.selected,
      this.val})
      : super(key: key);

  @override
  _DuwinRoundedBtnState createState() => _DuwinRoundedBtnState();
}

class _DuwinRoundedBtnState extends State<DuwinRoundedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.val == null
          ? widget.onPressed()
          : widget.onPressed(widget.val),
      child: Icon(
        widget.icon,
        color: widget.selected ? Colors.white : iconUntoggled,
      ),
      style: ElevatedButton.styleFrom(
        primary: widget.selected
            ? Theme.of(context).colorScheme.primary
            : Colors.white,
        shadowColor: Theme.of(context).colorScheme.primary,
        minimumSize: const Size.square(50.0),
        maximumSize: const Size.square(100.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
