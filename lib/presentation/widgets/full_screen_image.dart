import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({
    required this.imageUrl,
    required this.isBlurred,
    Key? key,
  }) : super(key: key);

  final bool isBlurred;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        /// If [isBlurred] value is passed as true, apply blurring
        /// effect on the image
        if (isBlurred) ...[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.transparent),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
