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
        child: Image.network(
          imageUrl,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error,
            );
          },
        ),
      ),
    );
  }
}
