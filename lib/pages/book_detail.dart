import 'package:duwin/widgets/duwinRoundedBtn.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late FToast _fToast;

  @override
  void initState() {
    _fToast = FToast();
    _fToast.init(context);
    super.initState();
  }

  Widget _buildToast(
    String text,
    Color color,
    Color textColor,
    IconData icon,
  ) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );

    return toast;
  }

  _showToast(Widget child) {
    _fToast.showToast(
      child: child,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: height / 2, maxHeight: height / 1.90),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2 / 3,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.square(1.0),
                                maximumSize: Size.square(50.0),
                                primary: Colors.blueGrey,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              child: Container(),
                            ),
                            const Text('Authur'),
                            DuwinRoundedBtn(
                              onPressed: () {
                                Widget toast = _buildToast(
                                    "Added",
                                    Theme.of(context).colorScheme.primary,
                                    Colors.white,
                                    Icons.check);
                                _showToast(toast);
                              },
                              icon: Icons.add,
                              selected: false,
                            ),
                            DuwinRoundedBtn(
                                onPressed: () {},
                                icon: Icons.favorite,
                                selected: true)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            'Romance',
                            'Action',
                            'Action',
                          ]
                              .map(
                                (e) => Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 4 / 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        border:
                                            Border.all(color: Colors.black87),
                                      ),
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Text(e),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Donwload'),
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Description'),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(height: 2.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
