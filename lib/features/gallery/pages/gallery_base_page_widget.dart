import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/gallery/model/event_type.dart';
import 'package:cascia_church_app/features/gallery/pages/images_gallery_page_widget.dart';
import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GalleryBasePageWidget extends ConsumerStatefulWidget {
  const GalleryBasePageWidget({Key? key}) : super(key: key);

  @override
  GalleryBasePageWidgetState createState() => GalleryBasePageWidgetState();
}

class GalleryBasePageWidgetState extends ConsumerState<GalleryBasePageWidget> {
  bool _isLoading = true;

  List<EventType> _allEventTypes = [];
  List<EventType> _fullEventTypes = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchEventTypes();
  }

  void _fetchEventTypes() {
    final _fetchedEvents =
        ref.read(galleryBaseViewModelProvider).fetchAllEventTypes();
    _fetchedEvents.then((value) {
      setState(() {
        _isLoading = false;
        _allEventTypes = value;
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
          title: AppLocalizations.of(context)!.translate('gallery'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getEventTypesList(
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

  Widget _getEventTypesList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allEventTypes = ref.read(galleryBaseViewModelProvider).allEventTypes;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allEventTypes.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allEventTypes.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No Event images found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildEventsListView(
                events: _allEventTypes,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchEventTypes();
  }

  Widget _buildEventsListView(
      {required List<EventType> events, required BuildContext context}) {
    final galleryBaseViewModel = ref.read(galleryBaseViewModelProvider);
    final utility = ref.read(utilityProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        return SingleLineListTileWidget(
          title: galleryBaseViewModel.getEventNameAtIndex(index),
          imageName: galleryBaseViewModel.getEventThumbnailUrlAtIndex(index),
          isNetworkImage: true,
          onTap: () {
            print("indo $index");
            _showDetailForIndex(galleryBaseViewModel.getEventIdAtIndex(index));
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
      itemCount: galleryBaseViewModel.getAllEventTypesCount(),
    );
  }

  void _showDetailForIndex(String eventId) {
    switch (eventId) {
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
