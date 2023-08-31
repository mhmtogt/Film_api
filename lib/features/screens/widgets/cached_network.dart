import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetwork extends StatelessWidget {
  final String imageUrl;
  final List<String> randomUrls;
  final Random random;

  const CachedNetwork({
    Key? key,
    required this.imageUrl,
    required this.randomUrls,
    required this.random,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
          imageUrl: randomUrls[random.nextInt(randomUrls.length)],
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
