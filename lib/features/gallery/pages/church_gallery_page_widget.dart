// import 'dart:async';

// import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
// import 'package:cascia_church_app/features/gallery/model/photo.dart';
// import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
// import 'package:cascia_church_app/providers/app_providers.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class AnimalsPageWidget extends ConsumerStatefulWidget {
//   const AnimalsPageWidget({Key? key}) : super(key: key);

//   @override
//   _AnimalsPageWidgetState createState() => _AnimalsPageWidgetState();
// }

// class _AnimalsPageWidgetState extends ConsumerState<AnimalsPageWidget> {
//   bool _isLoading = true;

//   final double _minOffset = 0.0;
//   late double _maxOffset;

//   List<Photo> _allPhotos = [];
//   bool _showNoResultsText = false;
//   final _placeNameTextController = TextEditingController();
//   Function? onPlaceSelected;
//   final String hintText = '';

//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _fetchImages();
//   }

//   _fetchImages() {
//     _allPhotos = [
//       Photo(
//         id: '1',
//         imageName: '',
//         title: '',
//       )
//     ];
//   }
//   // _fetchImages({String query = ''}) {
//   //   final _fetchedPhotos = context
//   //       .read(encyclopediaViewModelProvider)
//   //       .fetchAllEncyclopediaImages(query: query);
//   //   _fetchedPhotos.then((value) {
//   //     setState(() {
//   //       _fullPhotos = value;
//   //       _currentPhotosCount = 0;
//   //       _getNextPhotos();
//   //     });
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final utility = ref.read(utilityProvider);
//     final galleryBaseViewModel = ref.read(galleryBaseViewModelProvider);
//     return Scaffold(
//       backgroundColor: utility.appBackgroundColor,
//       appBar: PreferredSize(
//         child: TopAppBarWidget(
//           iconData: Icons.arrow_back_ios,
//           title: 'Encyclopedia',
//           toggleNavigation: () {},
//         ),
//         preferredSize: Size.fromHeight(55.0),
//       ),
//       body: Column(
//         children: [
//           // SearchAnimalTextFieldWidget(
//           //   searchTextDidChange: _searchTextDidChange,
//           //   onValueSubmitted: _onValueSubmitted,
//           //   placeNameTextController: _placeNameTextController,
//           //   hintText: hintText,
//           // ),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.only(
//                 bottom: 20.0,
//                 top: 10.0,
//               ),
//               child: _getEncyclopediaList(
//                 context: context,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // void _searchForQuery(BuildContext context, String value) async {
//   //   //if (value.length > 2) {
//   //   // final _queryProvider = context.read(queryProvider);
//   //   // _queryProvider.state = value;

//   //   // setState(() {
//   //   //   _isLoading = true;
//   //   //   _allPhotos = [];
//   //   //   _currentPhotosCount = 0;
//   //   //   _fullPhotos = [];
//   //   // });

//   //   if (_timer != null) {
//   //     _timer!.cancel();
//   //     _timer = null;
//   //   }

//   //   _timer = Timer(Duration(seconds: 1), () {
//   //     _fetchImages(query: value);
//   //   });
//   //   // }
//   // }

//   // void _fetchAnimals(BuildContext context) {
//   //   // final _apiKey = context.read(apiKeyProvider);
//   //   // _apiKey.state = mapboxApiKey;

//   //   // final _appStateProvier = context.read(appStateProvider);
//   //   // _appStateProvier.state = AppState.loadingState;

//   //   // context.read(placesFetchProvider).then((_places) {
//   //   //   final _placesListProvider = context.read(placesListProvider);
//   //   //   _placesListProvider.state = _places ?? [];

//   //   //   _appStateProvier.state = AppState.loadedState;
//   //   // });
//   // }

//   //TextField search methods
//   // void _searchTextDidChange(BuildContext context, String value) {
//   //   _searchForQuery(context, value);
//   // }

//   // void _onValueSubmitted(BuildContext context, String value) {
//   //   _searchForQuery(context, value);
//   // }

//   // Widget _getEncyclopediaList({required BuildContext context}) {
//   //   context.read(encyclopediaImagesProvider).whenData((_) {
//   //     _isLoading = false;
//   //   });
//   //   // _allPhotos.clear();
//   //   _allPhotos = context.read(encyclopediaViewModelProvider).getAllPhotos();

//   //   // _allPhotos.clear();
//   //   // _allPhotos = favoritesVMProvider.getAllPhotos();

//   //   return (_allPhotos.isEmpty && _isLoading)
//   //       ? Center(
//   //           child: SizedBox(
//   //             height: 120.0,
//   //             child: Image.asset('assets/images/loader.gif'),
//   //           ),
//   //         )
//   //       : (_allPhotos.isEmpty && _isLoading == false)
//   //           ? NoPhotosDataWidget(
//   //               noPhotosMessage:
//   //                   'No Encyclopedia images found at this time. Please try Refreshing again.',
//   //               refreshWidget: () => _refreshFavorites(context: context),
//   //             )
//   //           : _buildEncyclopediaGridView(
//   //               photos: _allPhotos,
//   //               context: context,
//   //             );
//   // }

//   void _refreshFavorites({required BuildContext context}) {
//     _fetchImages();
//   }

//   Widget _buildGalleryGridView(
//       {required List<Photo> photos, required BuildContext context}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10.0,
//       ),
//       child: StaggeredGridView.countBuilder(
//         crossAxisCount: 4,
//         itemCount: photos.length,
//         // padding: const EdgeInsets.only(
//         //   top: 15.0,
//         // ),
//         itemBuilder: (_, int index) {
//           final photo = photos[index];
//           return Stack(
//             fit: StackFit.expand,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute<AnimalFullScreenImagePageWidget>(
//                     builder: (_) => AnimalFullScreenImagePageWidget(
//                       photo: photo,
//                     ),
//                   ));
//                 },
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(10.0),
//                     ),
//                   ),
//                   clipBehavior: Clip.hardEdge,
//                   child: Hero(
//                     child: FadeInImage.assetNetwork(
//                       placeholder: 'assets/images/animal_placeholder.gif',
//                       image: photo.url,
//                       fit: BoxFit.cover,
//                       // placeholderScale: 0.5,
//                       // width: 60,
//                       // height: 60,
//                       // placeholderCacheHeight: 60,
//                       // placeholderCacheWidth: 60,
//                     ),
//                     tag: photo.publicId,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10.0),
//                       bottomRight: Radius.circular(10.0),
//                     ),
//                     color: Colors.black.withOpacity(0.7),
//                   ),
//                   height: 45.0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text(
//                         photo.animal,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 15.0,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         photo.species,
//                         maxLines: 1,
//                         overflow: TextOverflow.clip,
//                         style: TextStyle(color: Colors.white, fontSize: 13.0),
//                       ),
//                       SizedBox(
//                         height: 2.0,
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         },
//         staggeredTileBuilder: (int index) =>
//             StaggeredTile.count(2, index.isEven ? 2.7 : 2.3),
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//       ),
//     );
//   }
// }
