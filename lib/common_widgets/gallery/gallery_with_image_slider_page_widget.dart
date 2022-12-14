import 'package:cascia_church_app/common_widgets/gallery/gallery_image_view_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../features/gallery/view_models/gallery_base_view_model.dart';
import '../../features/gallery/view_models/images_gallery_view_model.dart';
import './gallery_model.dart';

// to view image in full screen
class GalleryWithImageSliderPageWidget extends ConsumerStatefulWidget {
  final int initialIndex;
  final String galleryFolderName;
  final String initialImagePublicID;
  final Axis scrollDirection;
  final String? titleGallery;
  final Icon iconBack;
  final BoxFit fit;
  final bool loop;
  final bool activeCarouselList;

  const GalleryWithImageSliderPageWidget({
    Key? key,
    this.titleGallery,
    required this.initialIndex,
    required this.galleryFolderName,
    required this.initialImagePublicID,
    this.scrollDirection = Axis.horizontal,
    required this.iconBack,
    required this.fit,
    required this.loop,
    required this.activeCarouselList,
  }) : super(key: key);

  // @override
  // State<StatefulWidget> createState() {
  //   return _GalleryWithImageSliderWidgetState();
  // }
  @override
  _GalleryWithImageSliderWidgetState createState() =>
      _GalleryWithImageSliderWidgetState();
}

class _GalleryWithImageSliderWidgetState
    extends ConsumerState<GalleryWithImageSliderPageWidget> {
  List<GalleryItemModel> _galleryItems = [];
  int imageUpdatedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  _fetchImages() {
    print("Path is ${widget.galleryFolderName}");
    final relatedPhotos = ref
        .read(galleryBaseViewModelProvider)
        .fetchAllImagesInAnimalFolder(widget.galleryFolderName);

    relatedPhotos.then((value) {
      setState(() {
        _galleryItems = value;
        imageUpdatedIndex = _getUpdatedIndex();
        print("_galleryItems ${_galleryItems.length}");
      });
    });
  }

  int _getUpdatedIndex() {
    print("element.id ${widget.initialImagePublicID}");
    return _galleryItems
        .indexWhere((element) => element.id == widget.initialImagePublicID);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: (_galleryItems.length == 0)
          ? Center(
              child: Image.asset('assets/images/loader.gif'),
            )
          : GalleryImageViewWrapper(
              titleGallery: widget.titleGallery,
              galleryItems: _galleryItems,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              initialIndex: imageUpdatedIndex,
              scrollDirection: Axis.horizontal,
              iconBack: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              fit: BoxFit.cover,
              loop: true,
              activeCarouselList: true,
            ),
    );
  }
}
