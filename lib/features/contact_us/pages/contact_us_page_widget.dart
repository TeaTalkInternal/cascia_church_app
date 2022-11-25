import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';

class ContactUsPageWidget extends ConsumerWidget {
  const ContactUsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final mainScreenHeight = utility.getMainContentHeight(context);
    final mainScreenWidth = utility.getMainContentWidth(context);
    final appLanguage = ref.read(appLanguageProvider);

    final mainHeading = 'ಸಂಪರ್ಕ್ ಕರಾ';

    final title1 = 'ವಿಳಾಸ್:';
    final description1 = """
ಸಾಂ. ರಿತಾ ಫಿರ್ಗಜ್, ಕಾಸ್ಸಿಯಾ
ಜೆಪ್ಪು, ಮಂಗ್ಳುರ್ - 575001
""";

    final title2 = 'ಫೋನ್:';
    final description2 = """
(ದಫ್ತರ್) 0824 2415702
(ವಿಗಾರ್) (ಮೊ)9740292871
""";
    final title3 = 'ದಫ್ತರಾಚೊ ವೇಳ್:';
    final description3 = """
ಹಫ್ತ್ಯಾಚಾ ದಿಸಾನಿ: ಸಕಾಳಿಂ 9 ಥಾವ್ನ್ - ಸಾಂಜೆರ್ 5 ಪರ್ಯಾಂತ್
ಸನ್ವಾರಾ: ಸಕಾಳಿಂ 9 ಥಾವ್ನ್ - ದನ್ಪಾರಾಂ 12 ಪರ್ಯಾಂತ್
""";
    final mainHeading2 =
        'ಫಿರ್ಗಜೆಚೆಂ ಸಭಾ ಸಾಲ್ (ಹೊಲ್) ಬುಕ್ಕಿಂಗ್ ಕರುಂಕ್ ದಫ್ತರಾಕ್ ಭೇಟ್ ದಿಂವ್ಚಿ.';

    final title4 = 'ಹೊಲಾಚೊ ವೇಳ್:';
    final description4 = """
ಸಕಾಳಿಂಚೆ ಕಾರ್ಯೆಂ: 10 ಥಾವ್ನ್ 3 ವರಾಂ ಪರ್ಯಾಂತ್
ಸಾಂಜೆಚೆಂ ಕಾರ್ಯೆಂ: 6 ಥಾವ್ನ್ 10:30 ಪರ್ಯಾಂತ್
""";
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('contact_us'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainHeading,
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title1,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description1,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(
                indent: 15,
                height: 0.2,
                color: utility.appGreyColor,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title2,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description2,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(
                indent: 15,
                height: 0.2,
                color: utility.appGreyColor,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title3,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description3,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                mainHeading2,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Divider(
                indent: 15,
                height: 0.2,
                color: utility.appGreyColor,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                title4,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                description4,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Divider(
                indent: 15,
                height: 0.2,
                color: utility.appGreyColor,
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
