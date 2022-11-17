import 'package:flutter/material.dart';

class ItemAction extends StatelessWidget {
  double height;
  double width;
  Color accent; 
  Function onClick;
  
  ItemAction({super.key, required this.height, required this.width, required this.accent, required this.onClick})

  @override
  Widget build(BuildContext context) {
    return Center();
  }

}