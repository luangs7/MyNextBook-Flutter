import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';

class GridItems<T> extends StatelessWidget {
  final Widget? Function(BuildContext, int) builder;
  final List<T> data;

  const GridItems({super.key, required this.builder, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final paddingBottom = MediaQuery.of(context).size.height * 0.1;
      final ratio =
          (MediaQuery.of(context).size.height * 0.40) / constraints.maxHeight;
      return GridView.builder(
        padding: EdgeInsets.only(
            right: defaultPadding, left: defaultPadding, bottom: paddingBottom),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: ratio,
            crossAxisCount: constraints.maxWidth > 700
                ? 4
                : 3, // Number of columns in the grid
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return builder.call(context, index);
        },
      );
    });
  }
}
