import 'package:cascia_church_app/common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/history/view_model/assistant_priests_history_view_model.dart';
import 'package:cascia_church_app/features/history/view_model/priests_history_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
          title: AppLocalizations.of(context)!.translate('parish_priest_title'),
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
          return ThumbnailListTileWidget(
            isArrowVisible: false,
            title: title,
            subTitle: subTitle,
            imageName:
                utility.getImageNameWithBasePath(imageName: 'priest.png'),
            // imageName: utility.getImageNameWithBasePath(
            //   imageName: assistantPriestsViewModel.getAssociationImageAtIndex(index),

            onTap: () {},
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
}
