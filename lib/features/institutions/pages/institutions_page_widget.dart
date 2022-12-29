import 'package:cascia_church_app/common_widgets/list_cells/double_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/institutions/models/institution.dart';
import 'package:cascia_church_app/features/institutions/view_models/institution_view_model.dart';
import 'package:cascia_church_app/features/gallery/pages/images_gallery_page_widget.dart';
import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InstitutionsPageWidget extends ConsumerStatefulWidget {
  const InstitutionsPageWidget({Key? key}) : super(key: key);

  @override
  InstitutionsPageWidgetState createState() => InstitutionsPageWidgetState();
}

class InstitutionsPageWidgetState
    extends ConsumerState<InstitutionsPageWidget> {
  bool _isLoading = true;

  List<Institution> _allInstitutions = [];
  List<Institution> _fullInstitutions = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchInstitutions();
  }

  void _fetchInstitutions() {
    final _fetchedInstitutions =
        ref.read(institutionViewModelProvider).fetchAllInstitutions();
    _fetchedInstitutions.then((value) {
      setState(() {
        _isLoading = false;
        _allInstitutions = value;
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
          title: AppLocalizations.of(context)!.translate('institutions'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getInstitutionsList(
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

  Widget _getInstitutionsList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allInstitutions = ref.read(institutionViewModelProvider).allInstitutions;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allInstitutions.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allInstitutions.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No institutions found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildInstitutionsListView(
                institutions: _allInstitutions,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchInstitutions();
  }

  Widget _buildInstitutionsListView(
      {required List<Institution> institutions,
      required BuildContext context}) {
    final institutionsViewModel = ref.read(institutionViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        final institution = institutionsViewModel.getInstitutionAtIndex(index);

        return DoubleLineListTileWidget(
          title: appLanguage.isEnglishLocale
              ? institutionsViewModel.getInstitutionEnglishName(institution)
              : institutionsViewModel.getInstitutionKonkaniName(institution),
          description: appLanguage.isEnglishLocale
              ? institutionsViewModel.getInstitutionAddress(institution)
              : institutionsViewModel.getInstitutionAddressKn(institution),
          imageName:
              institutionsViewModel.getInstitutionThumbnailUrlAtIndex(index),
          isNetworkImage: true,
          onTap: () {
            print("indo $index");
            // _showDetailForIndex(institutionsViewModel.getEventIdAtIndex(index));
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
      itemCount: institutionsViewModel.getAllInstitutionsCount(),
    );
  }

  void _showDetailForIndex(String institutionId) {
    switch (institutionId) {
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
