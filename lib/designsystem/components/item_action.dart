// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ItemAction extends StatelessWidget {
  double height;
  double width;
  Color accent; 
  Function onClick;
  
  ItemAction({
    Key? key,
    required this.height,
    required this.width,
    required this.accent,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: accent, width: 1, style: BorderStyle.solid)),
      child: IconButton(
          onPressed: onClick(),
          padding: const EdgeInsets.all(0.0),
          icon: Icon(
            Icons.favorite,
            size: 16,
            color: accent,
          )),
    );
  }

}
