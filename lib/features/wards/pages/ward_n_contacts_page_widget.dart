import 'package:cascia_church_app/common_widgets/list_cells/single_line_list_tile_widget.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/history/pages/assistant_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/church_history_page_widget.dart';
import 'package:cascia_church_app/features/history/pages/parish_priests_history_page_widget.dart';
import 'package:cascia_church_app/features/wards/pages/contacts_page_widget.dart';
import 'package:cascia_church_app/features/wards/pages/wards_page_widget.dart';
import 'package:cascia_church_app/features/wards/view_model/ward_n_contacts_view_model.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WardsNContactsPageWidget extends ConsumerStatefulWidget {
  const WardsNContactsPageWidget({Key? key}) : super(key: key);

  @override
  WardsNContactsPageWidgetState createState() =>
      WardsNContactsPageWidgetState();
}

class WardsNContactsPageWidgetState
    extends ConsumerState<WardsNContactsPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final wardsNContactsViewModel = ref.read(wardsnContactsViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('wards_families'),
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
            title: AppLocalizations.of(context)!.translate(
                wardsNContactsViewModel.getHistoryTitleAtIndex(index)),
            imageName: utility.getImageNameWithBasePath(
              imageName: wardsNContactsViewModel.getHistoryImageAtIndex(index),
            ),
            onTap: () {
              print("indo $index");
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
        itemCount: wardsNContactsViewModel.getAllHistorysCount(),
      ),
    );
  }

  void _showDetailForIndex(int index) {
    print("index $index");
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WardsPageWidget(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactsPageWidget(),
        ));
        break;
      default:
    }
  }
}
