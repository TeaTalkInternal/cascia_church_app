import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/top_app_bar_widget.dart';
import '../../../../localization/app_localizations.dart';
import '../../../../providers/app_providers.dart';
import '../../../common_widgets/list_cells/single_line_list_tile_widget.dart';
import '../../../common_widgets/no_photos_data_widget.dart';
import '../../gallery/pages/images_gallery_page_widget.dart';
import '../models/announcement.dart';
import '../view_models/announcements_by_type_view_model.dart';
import '../view_models/announcements_view_model.dart';

class GeneralAnnouncementPageWidget extends ConsumerStatefulWidget {
  const GeneralAnnouncementPageWidget({required this.announcement, Key? key})
      : super(key: key);
  final Announcement announcement;
  @override
  GeneralAnnouncementPageWidgetState createState() =>
      GeneralAnnouncementPageWidgetState();
}

class GeneralAnnouncementPageWidgetState
    extends ConsumerState<GeneralAnnouncementPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final announcement = widget.announcement;
    return Scaffold(
        backgroundColor: utility.appBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: TopAppBarWidget(
            title: announcement.title,
            toggleNavigation: () => Navigator.of(context).pop(),
            iconData: Icons.arrow_back_ios,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  announcement.title,
                  style: TextStyle(
                    color: utility.bodyTitleTextColor,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  announcement.description,
                  style: TextStyle(
                    color: utility.bodyTitleTextColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  announcement.location,
                  style: TextStyle(
                    color: utility.bodySubTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
