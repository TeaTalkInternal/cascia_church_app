import 'package:card_swiper/card_swiper.dart';
import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/features/announcements/models/announcement.dart';
import 'package:cascia_church_app/features/announcements/view_models/announcements_by_type_view_model.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';

import 'general_announcements_page_widget.dart';
import 'obituary-announcement-page-widget.dart';

class AnnouncementsByTypePageWidget extends ConsumerStatefulWidget {
  const AnnouncementsByTypePageWidget(
      {required this.newsType, required this.newsTitle, Key? key})
      : super(key: key);
  final String newsType;
  final String newsTitle;

  @override
  AnnouncementsByTypePageWidgetState createState() =>
      AnnouncementsByTypePageWidgetState();
}

class AnnouncementsByTypePageWidgetState
    extends ConsumerState<AnnouncementsByTypePageWidget> {
  bool _isLoading = true;

  List<Announcement> _allAnnouncements = [];
  List<Announcement> _fullAnnouncements = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchAnnouncements();
  }

  void _fetchAnnouncements() {
    final fetchedAnnouncements = ref
        .read(announcementsByTypeViewModelProvider)
        .fetchAllAnnouncements(widget.newsType);
    fetchedAnnouncements.then((value) {
      setState(() {
        _isLoading = false;
        _allAnnouncements = value;
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
          title: widget.newsTitle,
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getAnnouncementsList(
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

  Widget _getAnnouncementsList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allAnnouncements = ref.read(announcementViewModelProvider).allAnnouncements;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allAnnouncements.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allAnnouncements.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No announcements found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildAnnouncementsListView(
                announcements: _allAnnouncements,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchAnnouncements();
  }

  Widget _buildAnnouncementsListView(
      {required List<Announcement> announcements,
      required BuildContext context}) {
    final announcementsViewModel =
        ref.read(announcementsByTypeViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      itemBuilder: (listContext, index) {
        final announcement =
            announcementsViewModel.getAnnouncementAtIndex(index);

        return SingleLineListTileWidget(
          title: appLanguage.isEnglishLocale
              ? announcementsViewModel.getAnnouncementEnglishName(announcement)
              : announcementsViewModel.getAnnouncementKonkaniName(announcement),
          imageName:
              announcementsViewModel.getAnnouncementThumbnailUrlAtIndex(index),
          isNetworkImage: true,
          onTap: () {
            final announcement =
                announcementsViewModel.getAnnouncementAtIndex(index);

            if (announcement != null) {
              print("announcement ${announcement.newsType}");
              _showDetailForIndex(announcement);
            }
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
      itemCount: announcementsViewModel.getAllAnnouncementsCount(),
    );
  }

  void _showDetailForIndex(Announcement announcement) {
    switch (announcement.newsType) {
      case 'obituary':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ObituaryAnnouncementPageWidget(
            announcement: announcement,
          ),
        ));
        break;
      case 'matrimony':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ObituaryAnnouncementPageWidget(
            announcement: announcement,
          ),
        ));
        break;
      // case 1:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => const EventsGalleryPageWidget(),
      //   ));
      //   break;

      default:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GeneralAnnouncementPageWidget(
            announcement: announcement,
          ),
        ));
        break;
    }
  }
}
