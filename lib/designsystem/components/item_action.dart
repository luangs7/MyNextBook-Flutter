// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemAction extends StatelessWidget {
  double height;
  double width;
  Color accent;
  Function onClick;
  IconData icon;

  ItemAction(
      {Key? key,
      required this.height,
      required this.width,
      required this.accent,
      required this.onClick,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: accent, width: 1, style: BorderStyle.solid)),
        child: Icon(
          icon,
          size: 16,
          color: accent,
        ),
      ),
      onTap: () {
        onClick.call();
      },
    );
  }
}
