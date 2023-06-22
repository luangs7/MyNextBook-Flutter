import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieView extends StatelessWidget {
  String? asset;
  String? url;
  double? size;
  String? message;

  LottieView({super.key, this.asset, this.url, this.size, this.message});

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
                height: size ?? MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
              )
            : Lottie.network(
                url ?? "",
                repeat: true,
                height: size ?? MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
              ),
        message != null ? Text(message!) : const Center()
      ],
    );
  }
}
