import 'dart:async';
import 'dart:math';

import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/common_widgets/pages/full_screen_image_page_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/gallery/model/photo.dart';
import 'package:cascia_church_app/features/gallery/view_models/images_gallery_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ImagesGalleryPageWidget extends ConsumerStatefulWidget {
  const ImagesGalleryPageWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;
  @override
  ImagesGalleryPageWidgetState createState() => ImagesGalleryPageWidgetState();
}

class ImagesGalleryPageWidgetState
    extends ConsumerState<ImagesGalleryPageWidget> {
  bool _isLoading = true;
  List<Photo> _allPhotos = [];
  // List<Photo> _fullPhotos = [];
  // bool _showNoResultsText = false;

  final rnd = Random(150);
  late List<int> extents;

  @override
  void initState() {
    super.initState();
    extents = List<int>.generate(100, (index) => rnd.nextInt(3) + 1);
    _fetchPhotos();
  }

  void _fetchPhotos() {
    // Pass appropriate url here , Like for church church images fetch url
    final _fetchedEvents =
        ref.read(imagesGalleryViewModelProvider(widget.url)).fetchAllPhotos();
    _fetchedEvents.then((value) {
      setState(() {
        _isLoading = false;
        _allPhotos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);

    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('church_gallery'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getPhotosList(
        context: context,
      ),
    );
  }

  // void _fetchAnimals(BuildContext context) {
  //   // final _apiKey = context.read(apiKeyProvider);
  //   // _apiKey.state = mapboxApiKey;

  //   // final _appStateProvier = context.read(appStateProvider);
  //   // _appStateProvier.state = AppState.loadingState;

  //   // context.read(placesFetchProvider).then((_places) {
  //   //   final _placesListProvider = context.read(placesListProvider);
  //   //   _placesListProvider.state = _places ?? [];

  //   //   _appStateProvier.state = AppState.loadedState;
  //   // });
  // }

  Widget _getPhotosList({required BuildContext context}) {
    // ref.read(churchGalleryImagesProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allEventTypes = ref.read(galleryBaseViewModelProvider).allEventTypes;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allPhotos.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allPhotos.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No photos found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshPhotosList(context: context),
              )
            : _buildPhotosGridView(
                photos: _allPhotos,
                context: context,
              );
  }

  void _refreshPhotosList({required BuildContext context}) {
    _fetchPhotos();
  }

  Widget _buildPhotosGridView(
      {required List<Photo> photos, required BuildContext context}) {
    //final galleryBaseViewModel = ref.read(galleryBaseViewModelProvider);
    final utility = ref.read(utilityProvider);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: MasonryGridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        itemCount: photos.length,
        padding: const EdgeInsets.only(top: 15, bottom: 20),
        itemBuilder: (_, int index) {
          final photo = photos[index];
          final height = extents[index] * 100;
          return Container(
            height: height.toDouble(),
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () {
                    _openGalleryDetails(photo);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Hero(
                      child: FadeInImage.assetNetwork(
                        placeholder: utility.getImageNameWithBasePath(
                          imageName: 'loader.gif',
                        ),
                        image: photo.thumbnailUrl,
                        fit: BoxFit.cover,
                        // placeholderScale: 0.5,
                        // width: 60,
                        // height: 60,
                        // placeholderCacheHeight: 60,
                        // placeholderCacheWidth: 60,
                      ),
                      tag: photo.id,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    height: 30.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          photo.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void _openGalleryDetails(Photo photo) async {
    if (photo.isVideo) {
      final videoUrl = photo.videoUrl;
      final canOpen = await canLaunch(videoUrl);
      if (canOpen) {
        await launch(photo.videoUrl);
      }
    } else {
      Navigator.of(context).push(MaterialPageRoute<FullScreenPageWidget>(
        builder: (_) => FullScreenPageWidget(
          photo: photo,
        ),
      ));
    }
  }
}
