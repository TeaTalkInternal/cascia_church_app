import 'package:cascia_church_app/features/dashboard/widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/features/settings/pages/settings_page_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardPageWidget extends ConsumerWidget {
  const DashboardPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final mainScreenHeight = utility.getMainContentHeight(context);

    return Scaffold(
      body: Stack(children: [
        Container(
          height: mainScreenHeight * .35,
          decoration: BoxDecoration(
            image: DecorationImage(
              // alignment: Alignment.,
              fit: BoxFit.cover,
              image: AssetImage(
                utility.getImageNameWithBasePath(
                  imageName: 'casia_church_bg_curved.png',
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 35.0,
          right: 15.0,
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: utility.iconColor,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPageWidget(),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.translate('cascia_church'),
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  crossAxisCount: 2,
                  children: <Widget>[
                    DashboardGridItemWidget(
                      imageName: 'timing.png',
                      title: AppLocalizations.of(context)!
                          .translate('mass_timings'),
                    ),
                    DashboardGridItemWidget(
                      imageName: 'history.png',
                      title: AppLocalizations.of(context)!.translate('history'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class DashboardGridItemWidget extends ConsumerWidget {
  DashboardGridItemWidget({
    Key? key,
    required this.imageName,
    required this.title,
  }) : super(key: key);

  final String imageName;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final cardTextStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: utility.bodyTitleTextColor);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            utility.getImageNameWithBasePath(
              imageName: imageName,
            ),
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: cardTextStyle,
          )
        ],
      ),
    );
  }
}
