import 'package:cascia_church_app/features/dashboard/widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssociationsPageWidget extends ConsumerStatefulWidget {
  const AssociationsPageWidget({Key? key}) : super(key: key);

  @override
  AassociationsPageWidgetState createState() => AassociationsPageWidgetState();
}

class AassociationsPageWidgetState
    extends ConsumerState<AssociationsPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('associations'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.close,
        ),
      ),
      body: Container(),
    );
  }
}
