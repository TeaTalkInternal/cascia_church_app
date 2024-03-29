import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import './gallery_model.dart';

class GalleryItemThumbnail extends StatelessWidget {
  const GalleryItemThumbnail(
      {Key? key,
      required this.galleryItem,
      this.onTap,
      required this.height,
      required this.width})
      : super(key: key);

  final GalleryItemModel galleryItem;
  final GestureTapCallback? onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: galleryItem.id,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: width / 2,
          imageUrl: galleryItem.imageUrl,
          height: 100.0,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
