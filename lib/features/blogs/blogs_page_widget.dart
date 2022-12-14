import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';

class BlogsPageWidget extends ConsumerWidget {
  const BlogsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    final authorName = "ಬಾಪ್. ಎರಿಕ್ ಕ್ರಾಸ್ತಾ";
    final content = """
ಮರಿ ಆಮ್ಚೆ ಸರ್ಗಿಂಚೆ ಆವಯ್ಚೆಂ ಜಲ್ಮಾಚೆಂ ಫೆಸ್ತ್. ಕರಾವಳ್ ಪ್ರದೇಶಾಂತ್ "ಮೊಂತಿ ಫೆಸ್ತ್" ಮ್ಹಣ್ ನಾಂವಾಡ್ಲಾಂ.  ಮೊಂತಿ ಮಾಯ್ ಮ್ಹಣ್ಜೆ 'ದೊಂಗ್ರಾ ವಯ್ಲಿ ಸಾಯ್ಬಿಣ್', ತಿಕಾ ಪವಿತ್ರ್ ಸಭಾ ವಿಶೇಸ್ ಮಾನ್ ಆನಿ ಗವ್ರವ್ ದೀವ್ನ್ ತಿಚೊ ಜಲ್ಮಾ ದೀಸ್ ಸಂಭ್ರಮ್ತಾ.

ಮೊಂತಿ ಫೆಸ್ತ್ ಮಂಗ್ಳುರ್ ಗಾರಾಂಕ್ ಕುಟ್ಮಾಚೆಂ ಫೆಸ್ತ್. ಬಾಳಕ್ ಮರಿಯೆಕ್ ಫುಲಾಂ ಅರ್ಪುನ್, ನೋವ್ ದೀಸ್ ತಿಚೆಂ ಭಕ್ತಿಪಣ್ ಆಧಾರ್ನ್, ತಿಚಾ ಶೆಗುಣಿ ಜಿಣ್ಯೆಚೊ ನಿಯಾಳ್ ಕರುನ್, ಆಮ್ಚಾ ಶೆತಾನಿ ದೆವಾಚಾ ಆಶೀರ್ವಾದಾಕ್ ಲಾಗೊನ್, ಆಮ್ಚಾ ವಾವ್ರಾಚೊ ಫಳ್ ಜಾವ್ನ್ ದಿಲಾ ತ್ಯಾ ನವ್ಯಾ ಬೆಳ್ಯಾಚೆರ್ ದೆವಾಚೊ ಆಶೀರ್ವಾದ್ ಮಾಗೊನ್, ಕುಟ್ಮಾ ಸಾಂದ್ಯಾಂಚಾ ಸಾಂಗಾತ್ಪಣಾನ್ ಫೆಸ್ತಾಚೆಂ ಜೆವಾಣ್ ಜೆಂವ್ಚೆಂ ಏಕ್ ವೆಗ್ಳೊಚ್ ಅನುಭವ್. ಹೊ ಜಾವ್ನಾಸಾ ಕುಟ್ಮಾಚೊ ಸಂತೊಸ್. ಮರಿ ಮಾಂಯ್ ಆಮ್ಕಾಂ ಹೆಂ ದೆಣೆ ಜಿಯೆಂವ್ಕ್ ಪ್ರೇರಣ್ ಆನಿ ಆದರ್ಶ್.
""";

    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('blogs'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ಮೊಂತಿ ಮಾಯೆ ಆಮ್ಚಿಂ ಕುಟ್ಮಾ ಸಾಂಬಾಳ್",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    authorName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "11 December 2022 / 12:25",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/mother-mary.png',
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
