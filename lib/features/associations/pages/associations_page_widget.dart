import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/associations/models/association.dart';
import 'package:cascia_church_app/features/associations/view_models/association_view_model.dart';
import 'package:cascia_church_app/features/gallery/pages/images_gallery_page_widget.dart';
import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssociationsPageWidget extends ConsumerStatefulWidget {
  const AssociationsPageWidget({Key? key}) : super(key: key);

  @override
  AssociationsPageWidgetState createState() => AssociationsPageWidgetState();
}

class AssociationsPageWidgetState
    extends ConsumerState<AssociationsPageWidget> {
  bool _isLoading = true;

  List<Association> _allAssociations = [];
  List<Association> _fullAssociations = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchAssociations();
  }

  void _fetchAssociations() {
    final _fetchedAssociations =
        ref.read(associationViewModelProvider).fetchAllAssociations();
    _fetchedAssociations.then((value) {
      setState(() {
        _isLoading = false;
        _allAssociations = value;
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
          title: AppLocalizations.of(context)!.translate('associations'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getAssociationsList(
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

  Widget _getAssociationsList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allAssociations = ref.read(associationViewModelProvider).allAssociations;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allAssociations.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allAssociations.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No associations found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildAssociationsListView(
                associations: _allAssociations,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchAssociations();
  }

  Widget _buildAssociationsListView(
      {required List<Association> associations,
      required BuildContext context}) {
    final associationsViewModel = ref.read(associationViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        final association = associationsViewModel.getAssociationAtIndex(index);

        return SingleLineListTileWidget(
          title: appLanguage.isEnglishLocale
              ? associationsViewModel.getAssociationEnglishName(association)
              : associationsViewModel.getAssociationKonkaniName(association),
          imageName:
              associationsViewModel.getAssociationThumbnailUrlAtIndex(index),
          isNetworkImage: true,
          onTap: () {
            print("indo $index");
            // _showDetailForIndex(associationsViewModel.getEventIdAtIndex(index));
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
      itemCount: associationsViewModel.getAllAssociationsCount(),
    );
  }

  void _showDetailForIndex(String associationId) {
    switch (associationId) {
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
