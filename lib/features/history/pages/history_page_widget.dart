import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../view_model/history_view_model.dart';

class HistoryPageWidget extends ConsumerStatefulWidget {
  const HistoryPageWidget({Key? key}) : super(key: key);

  @override
  HistoryPageWidgetState createState() => HistoryPageWidgetState();
}

class HistoryPageWidgetState extends ConsumerState<HistoryPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final historyViewModel = ref.read(historyViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('history'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (listContext, index) {
          return SingleLineListTileWidget(
            title: historyViewModel.getHistoryTitleAtIndex(index),
            imageName: utility.getImageNameWithBasePath(
              imageName: historyViewModel.getHistoryImageAtIndex(index),
            ),
            onTap: () {
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
        itemCount: historyViewModel.getAllHistorysCount(),
      ),
    );
  }

  void _showDetailForIndex(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChurchHistoryPageWidget(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ChurchHistoryPageWidget(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AssistantPriestsPageWidget(),
        ));
        break;
      default:
    }
  }
}
