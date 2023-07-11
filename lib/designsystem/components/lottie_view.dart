import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../common/app_constants.dart';

class LottieView extends StatelessWidget {
  final String? asset;
  final String? url;
  final double? size;
  final String? message;

  const LottieView({super.key, this.asset, this.url, this.size, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        asset != null
            ? Lottie.asset(
                asset!,
                repeat: true,
                height: size ?? MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              )
            : Lottie.network(
                url ?? "",
                repeat: true,
                height: size ?? MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
        message != null
            ? Padding(
                padding: const EdgeInsets.only(
                    left: defaultPadding, right: defaultPadding),
                child: Text(
                  message!,
                  textAlign: TextAlign.center,
                ),
              )
            : const Center()
      ],
    );
  }
}
