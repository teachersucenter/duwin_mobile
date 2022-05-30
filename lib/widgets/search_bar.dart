import 'package:duwin/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function onPressed;
  final String? search;
  const SearchBar({Key? key, required this.onPressed, this.search})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    _controller.text = widget.search ?? '';

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(20.0),
      ),
      child: SizedBox(
        height: 40.0,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: iconUntoggled),
                    border: InputBorder.none,
                  ),
                  controller: _controller,
                  focusNode: _focusNode,
                  onSubmitted: (String text) => widget.onPressed(_controller),
                ),
              ),
            ),
            if (_controller.text.isNotEmpty | _focusNode.hasFocus)
              IconButton(
                onPressed: () {
                  _controller.clear();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  } else {
                    setState(() {});
                  }
                },
                splashRadius: 20.0,
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: iconUntoggled,
                ),
              ),
            FractionallySizedBox(
              heightFactor: 1,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100.0),
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: IconButton(
                    color: Colors.red,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        widget.onPressed(_controller);
                        _focusNode.unfocus();
                      }
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
