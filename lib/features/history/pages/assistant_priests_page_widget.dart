import 'package:cascia_church_app/common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/history/view_model/assistant_priests_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssistantPriestsPageWidget extends ConsumerStatefulWidget {
  const AssistantPriestsPageWidget({Key? key}) : super(key: key);

  @override
  AssistantPriestsPageWidgetState createState() =>
      AssistantPriestsPageWidgetState();
}

class AssistantPriestsPageWidgetState
    extends ConsumerState<AssistantPriestsPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final assistantPriestsViewModel =
        ref.read(assistantPriestsViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('assistant_priests'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.close,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (listContext, index) {
          final subTitle =
              '${assistantPriestsViewModel.getHistoryFromTimeAtIndex(index)} -- ${assistantPriestsViewModel.getHistoryToTimeAtIndex(index)}';
          return ThumbnailListTileWidget(
            title: assistantPriestsViewModel.getHistoryTitleAtIndex(index),
            subTitle: subTitle, imageName: '',
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
        itemCount: assistantPriestsViewModel.getAllHistorysCount(),
      ),
    );
  }
}
