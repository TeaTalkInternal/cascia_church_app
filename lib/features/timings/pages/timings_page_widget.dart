import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/no_photos_data_widget.dart';
import 'package:cascia_church_app/features/timings/models/timing.dart';
import 'package:cascia_church_app/features/timings/view_models/timing_view_model.dart';
import 'package:cascia_church_app/features/gallery/pages/images_gallery_page_widget.dart';
import 'package:cascia_church_app/features/gallery/view_models/gallery_base_view_model.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/list_cells/Timing_list_tile_widget.dart';
import '../../../common_widgets/list_cells/double_line_list_tile_widget.dart';
import '../../../common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';

class TimingsPageWidget extends ConsumerStatefulWidget {
  const TimingsPageWidget({Key? key}) : super(key: key);

  @override
  TimingsPageWidgetState createState() => TimingsPageWidgetState();
}

class TimingsPageWidgetState extends ConsumerState<TimingsPageWidget> {
  bool _isLoading = true;

  List<Timing> _allTimings = [];
  List<Timing> _fullTimings = [];
  bool _showNoResultsText = false;

  @override
  void initState() {
    super.initState();
    _fetchTimings();
  }

  void _fetchTimings() {
    final _fetchedTimings = ref.read(timingViewModelProvider).fetchAllTimings();
    _fetchedTimings.then((value) {
      setState(() {
        _isLoading = false;
        _allTimings = value;
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
          title: AppLocalizations.of(context)!.translate('mass_timings'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: _getTimingsList(
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

  Widget _getTimingsList({required BuildContext context}) {
    // ref.read(galleryEventsProvider).whenData((_) {
    //   _isLoading = false;
    // });
    // _allPhotos.clear();
    //_allTimings = ref.read(timingViewModelProvider).allTimings;

    // _allPhotos.clear();
    // _allPhotos = favoritesVMProvider.getAllPhotos();

    return (_allTimings.isEmpty && _isLoading)
        ? Center(
            child: SizedBox(
              height: 120,
              child: Image.asset('assets/images/loader.gif'),
            ),
          )
        : (_allTimings.isEmpty && _isLoading == false)
            ? NoPhotosDataWidget(
                noPhotosMessage:
                    'No timings found at this time. Please try Refreshing again.',
                refreshWidget: () => _refreshEventsList(context: context),
              )
            : _buildTimingsListView(
                timings: _allTimings,
                context: context,
              );
  }

  void _refreshEventsList({required BuildContext context}) {
    _fetchTimings();
  }

  Widget _buildTimingsListView(
      {required List<Timing> timings, required BuildContext context}) {
    final timingsViewModel = ref.read(timingViewModelProvider);
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return GroupedListView<Timing, String>(
      elements: timings,
      groupBy: (element) => element.massTypeKn,
      groupSeparatorBuilder: (String groupByValue) => Padding(
        padding: EdgeInsets.only(
          top: 15.0,
          bottom: 5.0,
          left: 20,
          right: 20,
        ),
        child: Text(
          timingsViewModel.getMassTypeHeaderKn(groupByValue),
          maxLines: 5,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: utility.darkGradientShadecolor),
        ),
      ),
      itemBuilder: (context, Timing element) => TimingListTileWidget(
        title: appLanguage.isEnglishLocale
            ? timingsViewModel.getMassTypeName(element)
            : timingsViewModel.getMassTypeNameKn(element),
        description: appLanguage.isEnglishLocale
            ? timingsViewModel.getTimingLanguage(element)
            : timingsViewModel.getTimingLanguageKn(element),
        timing: appLanguage.isEnglishLocale
            ? timingsViewModel.getTimingEnglishTime(element)
            : timingsViewModel.getTimingKonkaniTime(element),
        onTap: () {
          // print("indo $index");
          // _showDetailForIndex(timingsViewModel.getEventIdAtIndex(index));
        },
      ),
      itemComparator: (Timing item1, Timing item2) =>
          item2.day.compareTo(item1.day), // optional
      useStickyGroupSeparators: true, // optional
      floatingHeader: false, // optional
      order: GroupedListOrder.DESC, // optional
    );
  }

  // Widget _buildTimingsListView(
  //     {required List<Timing> timings, required BuildContext context}) {
  //   final timingsViewModel = ref.read(timingViewModelProvider);
  //   final utility = ref.read(utilityProvider);
  //   final appLanguage = ref.read(appLanguageProvider);
  //   return ListView.separated(
  //     padding: EdgeInsets.symmetric(
  //       vertical: 10,
  //       horizontal: 5,
  //     ),
  //     itemBuilder: (listContext, index) {
  //       final timing = timingsViewModel.getTimingAtIndex(index);

  //       return TimingListTileWidget(
  //         title: appLanguage.isEnglishLocale
  //             ? timingsViewModel.getTimingDay(timing)
  //             : timingsViewModel.getTimingDayKn(timing),
  //         description: appLanguage.isEnglishLocale
  //             ? timingsViewModel.getTimingLanguage(timing)
  //             : timingsViewModel.getTimingLanguageKn(timing),
  //         timing: appLanguage.isEnglishLocale
  //             ? timingsViewModel.getTimingEnglishTime(timing)
  //             : timingsViewModel.getTimingKonkaniTime(timing),
  //         onTap: () {
  //           print("indo $index");
  //           // _showDetailForIndex(timingsViewModel.getEventIdAtIndex(index));
  //         },
  //       );
  //     },
  //     separatorBuilder: (listContext, index) {
  //       return Divider(
  //         indent: 60,
  //         height: 0.2,
  //         color: utility.appGreyColor,
  //       );
  //     },
  //     itemCount: timingsViewModel.getAllTimingsCount(),
  //   );
  // }

  void _showDetailForIndex(String timingId) {
    switch (timingId) {
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
