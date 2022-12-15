import 'package:card_swiper/card_swiper.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/top_app_bar_widget.dart';
import '../../../localization/app_localizations.dart';
import '../../../providers/app_providers.dart';

class PreiestDetailsPageWidget extends ConsumerWidget {
  const PreiestDetailsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final appLanguage = ref.read(appLanguageProvider);

//     ಮಾ| ಬಾಪ್ ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದ್*
// ಜನನ್:
// ವೋಡ್ದ್:
// ಮರಣ್:
    final authorName = "ಮಾ| ಬಾಪ್. ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದ್";
    final bornDate = "ಜನನ್: --";
    final ordinationDate = "ವೋಡ್ದ್: --";
    final deathDate = "ಮರಣ್: ಜೂನ್ 23, 1969";
    final content = """
33 ವರ್ಸಾಂಚಿ ಕಾಸ್ಸಿಯಾ ಫಿರ್ಗಜೆಂತ್ ಪಯ್ಲೆಂ ಚಾಪ್ಲೆಯ್ನ್ ಜಾವ್ನ್ ಉಪ್ರಾಂತ್ ವಿಗಾರ್ ಜಾವ್ನ್ ಸೆವಾ ದಿಲ್ಲಿ ಕೀರ್ತ್! "ಕಾಸ್ಸಿಯಾ ಸಾಂ ರಿತಾ ಫಿರ್ಗಜೆಚೊ ಶಿಲ್ಪಿ" ಮ್ಹಣ್ ನಾವಾಡ್ಲೊಲೊ. ತಾಚಾ ಸಾಧನಾಚಾ ಲಾಂಬ್ ಪಟ್ಟೆಂತ್ಲಿಂ ಥೊಡಿಂ ಪ್ರಮುಖ್ ಘಡಿತಾಂ ಸಾಂಗ್ಚಿಂ ತರ್:

1935 ಮಾರ್ಚ್ 3 -  ಮಾ| ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದಾಕ್ ಕಾಸ್ಸಿಯಾಚೊ ಪಯ್ಲೊ ಚಾಪ್ಲೆಯ್ನ್ ಜಾವ್ನ್ ಭಿಸ್ಪಾನ್ ನೇಮಕ್ ಕೆಲೊ.  

1939 ದಸೆಂಬರ್ 15 - ಇಗರ್ಜೆಚಾ ಬಾಂದ್ಪಾಕ್ ಮುಲ್ಯಾ ಫಾತೊರ್.

ತವಳ್ಚ್ಯಾ ಮಹಾ ಝುಜಾ ವರ್ವಿಂ ದುಡ್ವಾಚಾ ಅಭಾವಾನ್ ಇಗರ್ಜೆ ಬಾಂದ್ಪಾಚೊ ವಾವ್ರ್ ಸವ್ಕಾಸಾಯೆನ್ ಚಲ್ಲೊ. 2% ವಾಡಿರ್ ಲೊಕಾ ಥಾವ್ನ್ ರೀಣ್ ಘೆವ್ನ್ ಫೆರ್ನಾಂದ್ ಬಾಪಾಬ್ ಬಾಂದ್ಪಾಚೊ ವಾವ್ರ್ ಚಾಲು ದವರ್ಲೊ. 

1942 ನವೆಂಬರ್ 22 - ಭಿಸ್ಪ್ ಅ| ಮಾ| ದೊತೊರ್ ವಿತೊರ್ ಆರ್ ಫೆರ್ನಾಂದಾನ್ ಇಗರ್ಜ್ ಉಗ್ತಾವ್ನ್ ಆಶೀರ್ವಾದಿತ್ ಕೆಲಿ.

20-10-1935 - ಆಲ್ತಾರ್ ಭುರ್ಗ್ಯಾಂಚಿ ಸೊಡೆಲಿಟಿ ಸ್ಥಾಪನ್ ಕೆಲಿ. ಫಿರ್ಗಜೆಂತ್ಲೊ ಹೊ ಪ್ರಥಮ್ ಸಂಘ್ ಸಂಸ್ಥೊ.

24-11-1935ವೆರ್ ಮಾಗ್ಣ್ಯಾಚಾ ಆಪೋಸ್ತಲಾದಿಚೊ ಸಂಘ್ ಸ್ಥಾಪ್ಲೊ. 

1936 ದಸೆಂಬರ್ 15 - ಮರಿಯೆಚಾ ಖಾತಾವಿಣ್ ಕಾಳ್ಜಾಚೊ ದಾದ್ಲ್ಯಾಂಚೊ ಸಂಘ್  ಸ್ಥಾಪನ್.

ಮಾರ್ಚ್ 14, 1937  - ಸಾಂ. ವಿಶೆಂತ್ ಪಾವ್ಲ್ ಸಭಾ ಸ್ಥಾಪನ್.

1947 ಫೆಬ್ರೆರ್ 3 -  ಕಾಸ್ಸಿಯಾ ಸಾಂ. ರಿತಾ ಫಿರ್ಗಜೆಚೊ ಪಯಿಲ್ಲೊ ವಿಗಾರ್ ಜಾವ್ನ್ ಭಿಸ್ಪಾನ್ ನೇಮಕ್ ಕೆಲೊ. (ತವಳ್ ಪರ್ಯಾಂತ್ ಚಾಪ್ಲೆಯ್ನ್ ಜಾವ್ನ್ ಆಸಲ್ಲೊ)

1950 ನವೆಂಬರಾಂತ್ ಸಾಂ. ರಿತಾಕ್ ಸಾಂತಿಣ್ ಮ್ಹಣ್ ಪಾಚಾರ್ಲೆಲ್ಲ್ಯಾ ಪನ್ನಾಸಾವೊ ಭಾಂಗ್ರಾಳೊ ಉತ್ಸವ್ ಸಂಭ್ರಮಾನ್ ಆಚರಣ್.

1959 ಅಗೋಸ್ತ್ 30 - ರು. 15,000 ಖರ್ಚಾರ್ ಫಿರ್ಗಜೆಚೆಂ ಸಭಾ ಸಾಲ್ ಉಗ್ತಾಯ್ಲೆಂ.

1960 ಇಸ್ವೆಚಾ ನವೆಂಬರಾಂತ್ ಸಾಂ. ರಿತಾಕ್ ಸಾಂತಿಣ್ ಮ್ಹಣ್ ಪಾಚಾರುನ್ ಸಾಟ್ ವರ್ಸಾಂ ಸಂಪ್ಲೆಲ್ಲ್ಯಾಚೊ  (1900-1960) ವಜ್ರಾಳೊ ಉತ್ಸವ್ ಆನಿ ಕಾಸ್ಸಿಯಾ ಫಿರ್ಗಜ್ ಸ್ಥಾಪನೆಚೊ ರುಪ್ಯಾಳೊ ಉತ್ಸವ್ (1935-1960) ಸಾಂಗಾತಾ ಗದ್ದಾಳಾಯೆನ್ ಆಚರಣ್ ಕೆಲೊ. 

1963 ಅಗೋಸ್ತಾಂತ್ ರು. 5000 ಖರ್ಚಾರ್ ಲೂರ್ದ್ ಮಾಯೆಚೊ ಗ್ರೊಟ್ಟೊ ಉಬಾರ್ಲೊ.

ಕಾಸ್ಸಿಯಾ ಫಿರ್ಗಜೆಚೊ ಪ್ರಥಮ್ ವಿಗಾರ್ ಫ್ರಾನ್ಸಿಸ್ ಸಾವೆರ್ ಫೆರ್ನಾಂದಾಕ್ "ಪಾಪಾಲ್ ಚಾಪ್ಲೆಯ್ನ್" ಬಿರುದ್ 1968ತ್ ಲಾಬ್ಲೆಂ. ತವಳ್ ತೊ ಅಸ್ವಸ್ತ್ ಆಸ್ಲೊ. ಕಂಕನಾಡಿ ವಿಯಾನ್ನಿ ಘರಾಂತ್ ತೊ 1968 ಮೇ 5 ಥಾವ್ನ್ ಮೇ 21, 1969 ಪರ್ಯಾಂತ್ ಆಸ್ಲೊ. ಮೇ 21 ವೆರ್ ತೊ ಮತಿಹೀನ್ (coma) ಜಾಲೊ ಆನಿ ಜೂನ್ 23 ವೆರ್ ರಾತಿಂ 10:30 ವರಾರ್ ಅಂತರ್ಲೊ. 1969 ಜೂನ್ 24ವೆರ್ ತಾಚಿ ನಿರ್ಜೀವ್ ಕೂಡ್ ಕಾಸ್ಸಿಯಾ ಇಗರ್ಜೆಕ್ ಹಾಡ್ಲಿ. ಭಿಸ್ಪ್ ಬಾಜಿಲ್ ಸೊಜಾನ್ ಸಾಂಜೆರ್ 5:00 ವರಾರ್ ಮೀಸ್ ಭೆಟವ್ನ್ ಶೆರ್ಮಾಂವ್ ದಿಲೊ. ಉಪ್ರಾಂತ್ ಪುರ್ಶಾಂವಾರ್ ರೈಲ್ವೆ ದುಸ್ರೊ ಸಾಂಖೊ (ಇಗರ್ಜೆ ಮುಕ್ಲೊ), ಮಾರ್ನೆಮಿಕಟ್ಟ, ಕಾಸ್ಸಿಯಾ ಇಸ್ಕೊಲ್, ಜೆಪ್ಪು ಮಾರ್ಕೆಟಿಂತ್ಲ್ಯಾನ್ ಮೊರ್ಗನ್ಸ್ ಗೇಟ್ ಮುಖಾಂತ್ರ್ ಇಗರ್ಜೆಕ್ ಹಾಡ್ನ್ ತಾಕಾ ಇಗರ್ಜೆ ಭಿತರ್ ನಿಕೆಪಿಲೊ.
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
