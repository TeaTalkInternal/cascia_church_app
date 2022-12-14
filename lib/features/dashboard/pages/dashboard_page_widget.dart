import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../announcements/pages/announcements_page_widget.dart';
import '../../associations/pages/associations_page_widget.dart';
import '../../blogs/blogs_page_widget.dart';
import '../../contact_us/pages/contact_us_page_widget.dart';
import '../../gallery/pages/gallery_base_page_widget.dart';
import '../../gallery/pages/grid_gallery_page_widget.dart';
import '../../history/pages/history_page_widget.dart';
import '../../institutions/pages/institutions_page_widget.dart';
import '../../settings/pages/settings_page_widget.dart';
import '../../timings/pages/timings_page_widget.dart';
import '../../wards/pages/wards_page_widget.dart';
import '../view_model/dashboard_view_model.dart';

class DashboardPageWidget extends ConsumerWidget {
  const DashboardPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final dashboardViewModel = ref.read(dashboardViewModelProvider);
    final mainScreenHeight = utility.getMainContentHeight(context);
    final appLanguage = ref.read(appLanguageProvider);
    final logoOffset = mainScreenHeight * 0.21;

    final title = appLanguage.isEnglishLocale
        ? "St. Rita Church, Cascia"
        : "ಸಾಂ. ರಿತಾ ಫಿರ್ಗಜ್, ಕಾಸ್ಸಿಯಾ";

    return Scaffold(
      backgroundColor: utility.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            actions: [
              IconButton(
                padding: EdgeInsets.only(
                  bottom: 10.0,
                  right: 10.0,
                ),
                icon: Icon(
                  Icons.settings,
                  color: utility.iconColor,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SettingsPageWidget(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ],
            pinned: true,
            expandedHeight: mainScreenHeight * .3,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(25.0),
                //   bottomRight: Radius.circular(25.0),
                // ),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    utility.darkGradientShadecolor,
                    utility.darkGradientShadecolor,
                    utility.lightGradientShadecolor,
                  ],
                ),
              ),
              child: FlexibleSpaceBar(
                title: Container(
                  child: Text(
                    title,
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0), //position of shadow
                          blurRadius: 4.0, //blur intensity of shadow
                          color: Colors.black
                              .withOpacity(0.8), //color of shadow with opacity
                        ),
                      ],
                    ),
                  ),
                ),
                background: Image.asset(
                  utility.getImageNameWithBasePath(
                    imageName: 'saint-rita-logo.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //3
          SliverPadding(
            padding: EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.75,
                  crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final option =
                      dashboardViewModel.getDashboardmenuOptions()[index];
                  final title = option.title;
                  final id = option.id;
                  return DashboardGridItemWidget(
                    imageName: option.imageName,
                    title: title,
                    onTap: () => menuCardTap(id, context),
                  );
                },
                childCount: dashboardViewModel.getDashboardmenuOptions().length,
              ),
            ),
          ),
        ],
      ),

      //   Stack(children: [
      //   Container(
      //     height: mainScreenHeight * .36,
      //     decoration: BoxDecoration(
      //       image: DecorationImage(
      //         // alignment: Alignment.,
      //         fit: BoxFit.cover,
      //         image: AssetImage(
      //           utility.getImageNameWithBasePath(
      //             imageName: 'saint-rita-logo.png',
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      //   Container(
      //     height: mainScreenHeight * .35,
      //     color: Colors.black.withOpacity(0.3),
      //   ),
      //   Positioned(
      //     top: 35,
      //     right: 15,
      //     child: IconButton(
      //       icon: Icon(
      //         Icons.settings,
      //         color: utility.iconColor,
      //         size: 35,
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (BuildContext context) => SettingsPageWidget(),
      //             fullscreenDialog: true,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      //   Padding(
      //     padding: EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: <Widget>[
      //         SizedBox(height: logoOffset),

      //         Padding(
      //           padding: const EdgeInsets.only(bottom: 0.0),
      //           child: Image.asset(
      //             utility.getImageNameWithBasePath(
      //               imageName: appLanguage.isEnglishLocale == true
      //                   ? 'cascia_logo_2.png'
      //                   : 'cascia_logo_4.png',
      //             ),
      //             height: mainScreenHeight * .12,
      //           ),
      //         ),

      // Expanded(
      //   child: GridView(
      //     primary: false,
      //     shrinkWrap: true,
      //     padding: const EdgeInsets.only(
      //         top: 25, left: 5, right: 5, bottom: 35),
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         mainAxisSpacing: 5,
      //         crossAxisSpacing: 5,
      //         childAspectRatio: 0.75,
      //         crossAxisCount: 2),
      //     children: List.generate(
      //       dashboardViewModel.getDashboardmenuOptions().length,
      //       (_index) {
      //         final _option =
      //             dashboardViewModel.getDashboardmenuOptions()[_index];
      //         final title = _option.title;
      //         final id = _option.id;
      //         return DashboardGridItemWidget(
      //           imageName: _option.imageName,
      //           title: title,
      //           onTap: () => menuCardTap(id, context),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      //         // const SizedBox(
      //         //   height: 30,
      //         // ),
      //         // Expanded(
      //         //   child: GridView.count(
      //         //     padding: EdgeInsets.only(top: 10),
      //         //     mainAxisSpacing: 8,
      //         //     crossAxisSpacing: 8,
      //         //     primary: false,
      //         //     crossAxisCount: 2,
      //         //     children: <Widget>[
      //         //       DashboardGridItemWidget(
      //         //         imageName: 'timings_image.png',
      //         //         title: AppLocalizations.of(context)!
      //         //             .translate('mass_timings'),
      //         //       ),
      //         //       DashboardGridItemWidget(
      //         //         imageName: 'history_image.png',
      //         //         title: AppLocalizations.of(context)!.translate('history'),
      //         //       ),
      //         //     ],
      //         //   ),
      //         // )
      //       ],
      //     ),
      //   )
      // ]),
    );
  }

  void menuCardTap(String id, BuildContext context) {
    print("id $id");
    switch (id) {
      case 'mass_timings':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const TimingsPageWidget(),
        ));
        break;
      case 'history':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HistoryPageWidget(),
        ));
        break;
      case 'associations':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AssociationsPageWidget(),
        ));
        break;
      case 'institutions':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const InstitutionsPageWidget(),
        ));
        break;
      case 'announcements':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AnnouncementPageWidget(),
        ));
        break;
      case 'photos':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GridGalleryPageWidget(),
        ));
        break;
      case 'wards_families':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WardsPageWidget(),
        ));
        break;
      case 'blogs':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BlogsPageWidget(),
        ));
        break;
      case 'contact_us':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactUsPageWidget(),
        ));
        break;
      default:
    }
  }
}

class DashboardGridItemWidget extends ConsumerWidget {
  DashboardGridItemWidget({
    Key? key,
    required this.imageName,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String imageName;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final cardTextStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: utility.bodyTitleTextColor,
    );
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 85,
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: utility.appGreyColor,
                  image: DecorationImage(
                      image: AssetImage(
                        utility.getImageNameWithBasePath(
                          imageName: imageName,
                        ),
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Text(
                AppLocalizations.of(context)!.translate(title),
                style: cardTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
