import 'package:cascia_church_app/common_widgets/list_cells/profile_name_thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/history/view_model/assistant_priests_history_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssistantPriestsHistoryPageWidget extends ConsumerStatefulWidget {
  const AssistantPriestsHistoryPageWidget({Key? key}) : super(key: key);

  @override
  AssistantPriestsHistoryPageWidgetState createState() =>
      AssistantPriestsHistoryPageWidgetState();
}

class AssistantPriestsHistoryPageWidgetState
    extends ConsumerState<AssistantPriestsHistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final assistantPriestsViewModel =
        ref.read(assistantPriestsHistoryViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: 'asst_parish_priest_title'.tr(),
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
              '${assistantPriestsViewModel.getHistoryFromTimeAtIndex(index)} -- ${assistantPriestsViewModel.getHistoryToTimeAtIndex(index)}';
          final priestHistory =
              assistantPriestsViewModel.getHistoryAtIndex(index);
          final appLanguage = ref.read(appLanguageProvider);
          final title = appLanguage.isEnglishLocale
              ? assistantPriestsViewModel.getHistoryEnglishTitle(priestHistory)
              : assistantPriestsViewModel.getHistoryKonkaniTitle(priestHistory);
          // return ThumbnailListTileWidget(
          //   isArrowVisible: false,
          //   title: title,
          //   subTitle: subTitle,
          //   imageName: utility.getImageNameWithBasePath(
          //       imageName: 'assistant_priest.png'),
          //   // imageName: utility.getImageNameWithBasePath(
          //   //   imageName: assistantPriestsViewModel.getAssociationImageAtIndex(index),

          //   onTap: () {},
          // );
          return ProfileNameThumbnailListTileWidget(
            isArrowVisible: false,
            title: title,
            subTitle: subTitle,
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
        itemCount: assistantPriestsViewModel.getAllHistorysCount(),
      ),
    );
  }
}
