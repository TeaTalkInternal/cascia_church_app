import 'package:card_swiper/card_swiper.dart';
import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/announcements/models/announcement.dart';
import 'package:cascia_church_app/features/announcements/view_models/announcements_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'announcements_by_type_page_widget.dart';

class AnnouncementPageWidget extends ConsumerStatefulWidget {
  const AnnouncementPageWidget({Key? key}) : super(key: key);

  @override
  AnnouncementPageWidgetState createState() => AnnouncementPageWidgetState();
}

class AnnouncementPageWidgetState
    extends ConsumerState<AnnouncementPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final announcementViewModel = ref.read(announcementViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('announcements'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        itemBuilder: (listContext, index) {
          return SingleLineListTileWidget(
            title: announcementViewModel.getAnnouncementTitleAtIndex(index),
            imageName: utility.getImageNameWithBasePath(
              imageName:
                  announcementViewModel.getAnnouncementImageAtIndex(index),
            ),
            onTap: () {
              print('indo $index');
              _showDetailForIndex(index);
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
        itemCount: announcementViewModel.getAllAnnouncementsCount(),
      ),
    );
  }

  void _showDetailForIndex(int index) {
    final announcementViewModel = ref.read(announcementViewModelProvider);
    final title = announcementViewModel.getAnnouncementTitleAtIndex(index);
    final identifier = announcementViewModel.getAnnouncementIdAtIndex(index);
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnnouncementsByTypePageWidget(
            newsType: identifier,
            newsTitle: title,
          ),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnnouncementsByTypePageWidget(
            newsType: identifier,
            newsTitle: title,
          ),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnnouncementsByTypePageWidget(
            newsType: identifier,
            newsTitle: title,
          ),
        ));
        break;
      default:
    }
  }
}
