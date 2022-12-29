import 'package:card_swiper/card_swiper.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/providers/app_providers.dart';

class PreiestDetailsPageWidget2 extends ConsumerWidget {
  const PreiestDetailsPageWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);

//     ಮಾ| ಬಾಪ್ ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದ್*
// ಜನನ್:
// ವೋಡ್ದ್:
// ಮರಣ್:
    final authorName = "ಬಾಪ್. ಜೊನ್ ಎಂ. ಮಿನೇಜಸ್";
    final bornDate = "ಜನನ್: --";
    final ordinationDate = "ವೋಡ್ದ್: --";
    final deathDate = "27 ಸಪ್ಟೆಂಬರ್ 1973";
    final content = """
1970 ಥಾವ್ನ್ 1973 ಪರ್ಯಾಂತ್ ವಿಗಾರ್ ಜಾವ್ನ್ ಸೆವಾ

ಶೆರ್ಮಾಂವ್ ಆನಿ ಆಧ್ಯಾತ್ಮಿಕ್ ಶಿಕೊಣ್ ದಿಂವ್ಚಾಂತ್ ಭಾರಿಚ್ ನಿಪುಣ್

Bal Christ Nursery School ಆನಿ
St. Rita Eng. Medium Primary School ತಾಚಾ ಸಾಧನಾನ್ ಸುರು ಜಾಲ್ಲಿಂ.
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
