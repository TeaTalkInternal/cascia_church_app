import 'package:card_swiper/card_swiper.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';

class PreiestDetailsPageWidget4 extends ConsumerWidget {
  const PreiestDetailsPageWidget4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);

//     ಮಾ| ಬಾಪ್ ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದ್*
// ಜನನ್:
// ವೋಡ್ದ್:
// ಮರಣ್:
    final authorName = "ಬಾಪ್. ರೊಬರ್ಟ್ ಪಿಂಟೊ";
    final bornDate = "ಜನನ್: --";
    final ordinationDate = "ವೋಡ್ದ್: --";
    final deathDate = "ಮರಣ್: --";
    final content = """
1981 ಥಾವ್ನ್ 1988 ಪರ್ಯಾಂತ್ ವಿಗಾರ್ ಜಾವ್ನ್ ಆಮ್ಚಾ ಫಿರ್ಗಜೆಂತ್ ವಾವ್ರ್

ತೊ ಏಕ್ ಬರೊ ಪ್ರಸಂಗ್ ದಾರ್. ಫಿರ್ಗಜೆಚಾ ಸರ್ವ್ ಲೊಕಾಂನಿ ಇಗರ್ಜೆ ಭಿತರ್ ಸಾಂಗಾತಾಚ್ ರಾವೊನ್ ಮೀಸ್ ಭೆಟಂವ್ಚಾ ಇರಾದ್ಯಾನ್ ಇಗರ್ಜೆಚೊ ಪೋರ್ಟಿಗೊ ಭಿತರ್ ಘೆತ್ಲೊ ಆನಿ ಲೊಕಾಕ್ ಚಡಿತ್ ಬಸ್ಕೆಚಿ ವಿಲೆವಾರಿ ಕೆಲಿ. 

ಫಿರ್ಗಜ್ ಸಾಲ್ ನವೀಕರಣ್ ಕರ್ನ್ ತಾಂತುಂಯ್ ಬಸ್ಕಾ ಚಡಯ್ಲ್ಯೊ.

St. Rita Eng. Med. Primary School ಕ್ ನವೆಂ ಬಾಂದಾಪ್ ಬಾಂದಯ್ಲೆಂ. 11 ಸಪ್ಟೆಂಬರ್ 1988ತ್ ತೊ ಮುಲ್ಕಿ ಫಿರ್ಗಜೆಕ್ ವರ್ಗ್ ಜಾವ್ನ್ ಗೆಲೊ ಆನಿ ಆಪ್ಲ್ಯಾ 70 ವರ್ಸಾಂಚಾ ಪ್ರಾಯೆರ್ ದೆವಾದಿನ್ ಜಾಲೊ.
""";

    return Scaffold(
      backgroundColor: utility.appBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: authorName,
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
                authorName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              EasyRichText(
                bornDate,
                patternList: [
                  EasyRichTextPattern(
                    targetString: 'ಜನನ್:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
                defaultStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              EasyRichText(
                ordinationDate,
                patternList: [
                  EasyRichTextPattern(
                    targetString: 'ವೋಡ್ದ್:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
                defaultStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              EasyRichText(
                deathDate,
                patternList: [
                  EasyRichTextPattern(
                    targetString: 'ಮರಣ್:',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
                defaultStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
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
