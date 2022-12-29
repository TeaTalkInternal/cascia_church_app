import 'package:card_swiper/card_swiper.dart';
import 'package:cascia_church_app/features/announcements/models/announcement.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';

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
