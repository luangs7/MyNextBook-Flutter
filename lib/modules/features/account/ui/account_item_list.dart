import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';

class AccountItemList extends StatelessWidget {

  final String label;
  final Function onTap;

  const AccountItemList({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Ink(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: 1, style: BorderStyle.solid),
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(27)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: AppTextTheme()
                      .h30
                      .bold()
                      .copyWith(color: Colors.black87)),
            ),
            onTap: () => onTap.call(),
          ),
        ));
  }
}