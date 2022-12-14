import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';
import '../../../utility/utility.dart';
import '../view_model/church_history_view_model.dart';

class ChurchHistoryPageWidget extends ConsumerWidget {
  const ChurchHistoryPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final mainScreenWidth = utility.getMainContentWidth(context);
    final churchHistoryViewModel = ref.read(churchHistoryViewModelProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title:
              AppLocalizations.of(context)!.translate('church_history_title'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          //width: mainScreenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(
                //   height: mainScreenHeight * .35,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(10),
                //     child: Expanded(
                //         child: Swiper(
                //       itemBuilder: (context, index) {
                //         return Image.asset(
                //           utility.getImageNameWithBasePath(
                //               imageName:
                //                   churchHistoryViewModel.churchImages[index]),
                //           fit: BoxFit.fill,
                //         );
                //       },
                //       autoplay: false,
                //       itemCount: churchHistoryViewModel.churchImages.length,
                //       control: const SwiperControl(color: Colors.white),
                //     )),
                //   ),
                // ),
                Container(
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Swiper(
                      itemBuilder: (context, index) {
                        return Image.asset(
                          utility.getImageNameWithBasePath(
                              imageName:
                                  churchHistoryViewModel.churchImages[index]),
                          fit: BoxFit.fill,
                        );
                      },
                      autoplay: false,
                      itemCount: churchHistoryViewModel.churchImages.length,
                      control: SwiperControl(
                        color: Colors.white,
                        iconNext: Icons.arrow_circle_right_sharp,
                        iconPrevious: Icons.arrow_circle_left_sharp,
                        size: 40.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  appLanguage.isEnglishLocale
                      ? churchHistoryViewModel.churchHistoryKn
                      : churchHistoryViewModel.churchHistoryKn,
                  // style: const TextStyle(
                  //     fontSize: 16, fontWeight: FontWeight.w400, height: 1.7),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
