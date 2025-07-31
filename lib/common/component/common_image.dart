import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CommonImage({
    super.key,
    required this.imageUrl,
    this.width = 50.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) {
            return const Icon(
              Icons.error,
            );
          },
        ),
      ),
    );
  }
}
