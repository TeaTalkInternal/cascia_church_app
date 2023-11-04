import 'package:cascia_church_app/common_widgets/list_cells/profile_name_thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/history/pages/priest_details_page_widget_3.dart';
import 'package:cascia_church_app/features/history/pages/priest_details_page_widget_2.dart';
import 'package:cascia_church_app/features/history/pages/priest_details_page_widget_4.dart';
import 'package:cascia_church_app/features/history/view_model/assistant_priests_history_view_model.dart';
import 'package:cascia_church_app/features/history/view_model/priests_history_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'priest_details_page_widget.dart';

class PriestsHistoryPageWidget extends ConsumerStatefulWidget {
  const PriestsHistoryPageWidget({Key? key}) : super(key: key);

  @override
  PriestsHistoryPageWidgetState createState() =>
      PriestsHistoryPageWidgetState();
}

class PriestsHistoryPageWidgetState
    extends ConsumerState<PriestsHistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final priestsViewModel = ref.read(priestsHistoryViewModelProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: 'parish_priest_title'.tr(),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: 10,
          left: 5,
          right: 5,
          bottom: 20,
        ),
        itemBuilder: (listContext, index) {
          final subTitle =
              '${priestsViewModel.getHistoryFromTimeAtIndex(index)} -- ${priestsViewModel.getHistoryToTimeAtIndex(index)}';
          final priestHistory = priestsViewModel.getHistoryAtIndex(index);
          final title = appLanguage.isEnglishLocale
              ? priestsViewModel.getHistoryEnglishTitle(priestHistory)
              : priestsViewModel.getHistoryKonkaniTitle(priestHistory);
          // return ThumbnailListTileWidget(
          //   isArrowVisible: false,
          //   title: title,
          //   subTitle: subTitle,
          //   imageName:
          //       utility.getImageNameWithBasePath(imageName: 'priest.png'),
          //   // imageName: utility.getImageNameWithBasePath(
          //   //   imageName: assistantPriestsViewModel.getAssociationImageAtIndex(index),

          //   onTap: () {},
          // );
          return ProfileNameThumbnailListTileWidget(
            isArrowVisible:
                (index == 0 || index == 2 || index == 3 || index == 4),
            title: title,
            subTitle: subTitle,
            onTap: () => _showDetails(index),
          );
        },
        separatorBuilder: (listContext, index) {
          return Divider(
            indent: 60,
            height: 0.2,
            color: utility.appGreyColor,
          );
        },
        itemCount: priestsViewModel.getAllHistorysCount(),
      ),
    );
  }

  void _showDetails(int index) {
    print("_showDetails");
    if (index == 0) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PreiestDetailsPageWidget()));
    } else if (index == 2) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PreiestDetailsPageWidget2()));
    } else if (index == 3) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PreiestDetailsPageWidget3()));
    } else if (index == 4) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const PreiestDetailsPageWidget4()));
    }
  }
}
