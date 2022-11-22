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

    final contactText = """
ಸಂಪರ್ಕ್ ಕರಾ

ವಿಳಾಸ್: ಸಾಂ. ರಿತಾ ಫಿರ್ಗಜ್, ಕಾಸ್ಸಿಯಾ
              ಜೆಪ್ಪು, ಮಂಗ್ಳುರ್ - 575001

ಫೋನ್: (ದಫ್ತರ್) 0824 2415702
             (ವಿಗಾರ್) (ಮೊ)9740292871
ದಫ್ತರಾಚೊ ವೇಳ್:
ಹಫ್ತ್ಯಾಚಾ ದಿಸಾನಿ - ಸಕಾಳಿಂ 9 ಥಾವ್ನ್
                              ಸಾಂಜೆರ್ 5 ಪರ್ಯಾಂತ್
ಸನ್ವಾರಾ - ಸಕಾಳಿಂ 9 ಥಾವ್ನ್ 
               ದನ್ಪಾರಾಂ 12 ಪರ್ಯಾಂತ್

ಫಿರ್ಗಜೆಚೆಂ ಸಭಾ ಸಾಲ್ (ಹೊಲ್) ಬುಕ್ಕಿಂಗ್ ಕರುಂಕ್ ದಫ್ತರಾಕ್ ಭೇಟ್ ದಿಂವ್ಚಿ.

ಹೊಲಾಚೊ ವೇಳ್:
ಸಕಾಳಿಂಚೆ ಕಾರ್ಯೆಂ: 10 ಥಾವ್ನ್ 3 ವರಾಂ ಪರ್ಯಾಂತ್

ಸಾಂಜೆಚೆಂ ಕಾರ್ಯೆಂ: 6 ಥಾವ್ನ್ 10:30 ಪರ್ಯಾಂತ್
""";
    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('families'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Text(
              contactText,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
