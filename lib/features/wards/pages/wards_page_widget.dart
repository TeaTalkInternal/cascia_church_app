import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/gallery/pages/images_gallery_page_widget.dart';
import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/wards/model/ward.dart';
import 'package:cascia_church_app/features/wards/view_model/wards_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'contacts_page_widget.dart';

class WardsPageWidget extends ConsumerStatefulWidget {
  const WardsPageWidget({Key? key}) : super(key: key);

  @override
  WardsPageWidgetState createState() => WardsPageWidgetState();
}

class WardsPageWidgetState extends ConsumerState<WardsPageWidget> {
  bool _isLoading = true;

  List<Ward> _allWards = [];
  List<Ward> _fullWards = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchWards();
  }

  void _fetchWards() {
    final _fetchedWards = ref.read(wardsViewModelProvider).fetchAllWards();
    _fetchedWards.then((value) {
      setState(() {
        _isLoading = false;
        _allWards = value;
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
          title: 'wards'.tr(),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getWardsList(
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

  Widget _getWardsList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allWards = ref.read(wardsViewModelProvider).allWards;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allWards.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allWards.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No wards found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildWardsListView(
                wards: _allWards,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchWards();
  }

  Widget _buildWardsListView(
      {required List<Ward> wards, required BuildContext context}) {
    final wardsViewModel = ref.read(wardsViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        final ward = wardsViewModel.getWardAtIndex(index);

        return SingleLineListTileWidget(
          title: appLanguage.isEnglishLocale
              ? wardsViewModel.getWardEnglishName(ward)
              : wardsViewModel.getWardKonkaniName(ward),
          imageName: wardsViewModel.getWardThumbnailUrlAtIndex(index),
          isNetworkImage: true,
          onTap: () {
            print("indo $index");
            // _showDetailForIndex(wardsViewModel.getEventIdAtIndex(index));
            if (index == 7)
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactsPageWidget()));
          },
        );
      },
      separatorBuilder: (listContext, index) {
        return Divider(
          indent: 60,
          height: 0.2,
          color: utility.appGreyColor,
        );
      },
      itemCount: wardsViewModel.getAllWardsCount(),
    );
  }

  void _showDetailForIndex(String wardId) {
    switch (wardId) {
      case 'church-images':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ImagesGalleryPageWidget(
            url: '',
          ),
        ));
        break;
      // case 1:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const EventsGalleryPageWidget(),
      //   ));
      //   break;

      default:
    }
  }
}
