import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/list_cells/thumbnail_list_tile_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../../common_widgets/top_app_bar_widget.dart';
import '../view_models/association_view_model.dart';

class AssociationsPageWidget extends ConsumerStatefulWidget {
  const AssociationsPageWidget({Key? key}) : super(key: key);

  @override
  AssociationsPageWidgetState createState() => AssociationsPageWidgetState();
}

class AssociationsPageWidgetState
    extends ConsumerState<AssociationsPageWidget> {
  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final associationViewModel = ref.read(associationViewModelProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('associations'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (listContext, index) {
          return ThumbnailListTileWidget(
            title: associationViewModel.getAssociationTitleAtIndex(index),
            subTitle: associationViewModel
                .getAssociationShortDescriptionAtIndex(index),
            imageName: utility.getImageNameWithBasePath(
              imageName: associationViewModel.getAssociationImageAtIndex(index),
            ),
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
        itemCount: associationViewModel.getAllAssociationsCount(),
      ),
    );
  }
}
