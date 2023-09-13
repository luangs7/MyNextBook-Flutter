import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;

  const ItemImage({super.key, required this.url, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        height: height,
        width: width,
        imageUrl: url,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}
