import 'package:card_swiper/card_swiper.dart';
import 'package:cascia_church_app/common_widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreiestDetailsPageWidget3 extends ConsumerWidget {
  const PreiestDetailsPageWidget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);

//     ಮಾ| ಬಾಪ್ ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದ್*
// ಜನನ್:
// ವೋಡ್ದ್:
// ಮರಣ್:
    final authorName = "ಬಾಪ್. ಜೆ.ಜೆ.ಸಲ್ಡಾನ್ಹಾ";
    final bornDate = "ಜನನ್: --";
    final ordinationDate = "ವೋಡ್ದ್: --";
    final deathDate = "--";
    final content = """
1974 ಥಾವ್ನ್ 1981 ಪರ್ಯಾಂತ್ ವಿಗಾರ್ ಜಾವ್ನ್ ಸೆವಾ.

ಕಾಸ್ಸಿಯಾ ಹೈಸ್ಕೂಲಾಚಾ ರುಪ್ಯೋತ್ಸವಾ ಸಂದರ್ಭಿಂ ನವೆಂ ಕಟ್ಟೊಣ್ ತಾಣೆ ಬಾಂದಯ್ಲೆಂ.
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
