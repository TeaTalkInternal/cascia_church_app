import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../announcements/announcements_page_widget.dart';
import '../../associations/pages/associations_page_widget.dart';
import '../../blogs/blogs_page_widget.dart';
import '../../contact_us/pages/contact_us_page_widget.dart';
import '../../gallery/pages/gallery_base_page_widget.dart';
import '../../history/pages/history_page_widget.dart';
import '../../institutions/pages/institutions_page_widget.dart';
import '../../settings/pages/settings_page_widget.dart';
import '../../timings/pages/timings_page_widget.dart';
import '../../wards/pages/ward_n_contacts_page_widget.dart';
import '../view_model/dashboard_view_model.dart';

class DashboardPageWidget extends ConsumerWidget {
  const DashboardPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final dashboardViewModel = ref.read(dashboardViewModelProvider);
    final mainScreenHeight = utility.getMainContentHeight(context);

    return Scaffold(
      backgroundColor: utility.scaffoldBackgroundColor,
      body: Stack(children: [
        Container(
          height: mainScreenHeight * .45,
          decoration: BoxDecoration(
            image: DecorationImage(
              // alignment: Alignment.,
              fit: BoxFit.cover,
              image: AssetImage(
                utility.getImageNameWithBasePath(
                  imageName: 'saint-rita-logo.png',
                ),
              ),
            ),
          ),
        ),
        Container(
          height: mainScreenHeight * .45,
          color: Colors.black.withOpacity(0.4),
        ),
        Positioned(
          top: 35,
          right: 15,
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: utility.iconColor,
              size: 35,
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
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0, right: 15.0, left: 15.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 30),
              Image.asset(
                utility.getImageNameWithBasePath(
                  imageName: 'cascia.png',
                ),
                height: mainScreenHeight * .19,
              ),

              Expanded(
                child: GridView(
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      top: 25, left: 5, right: 5, bottom: 35),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.85,
                      crossAxisCount: 2),
                  children: List.generate(
                    dashboardViewModel.getDashboardmenuOptions().length,
                    (_index) {
                      final _option =
                          dashboardViewModel.getDashboardmenuOptions()[_index];
                      final title = _option.title;
                      final id = _option.id;
                      return DashboardGridItemWidget(
                        imageName: _option.imageName,
                        title: title,
                        onTap: () => menuCardTap(id, context),
                      );
                    },
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              // Expanded(
              //   child: GridView.count(
              //     padding: EdgeInsets.only(top: 10),
              //     mainAxisSpacing: 8,
              //     crossAxisSpacing: 8,
              //     primary: false,
              //     crossAxisCount: 2,
              //     children: <Widget>[
              //       DashboardGridItemWidget(
              //         imageName: 'timings_image.png',
              //         title: AppLocalizations.of(context)!
              //             .translate('mass_timings'),
              //       ),
              //       DashboardGridItemWidget(
              //         imageName: 'history_image.png',
              //         title: AppLocalizations.of(context)!.translate('history'),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        )
      ]),
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
          builder: (context) => const AnnouncementsPageWidget(),
        ));
        break;
      case 'photos':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GalleryBasePageWidget(),
        ));
        break;
      case 'wards_families':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const WardsNContactsPageWidget(),
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
      fontSize: 18,
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
                height: 100,
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
