import 'package:cascia_church_app/features/dashboard/widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:cascia_church_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPageWidget extends ConsumerStatefulWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  _SettingsPageWidgetState createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends ConsumerState<SettingsPageWidget> {
  bool languageToggleValue = false;
  bool darkModeToggleValue = false;

  @override
  void initState() {
    super.initState();
    final appLanguage = ref.read(appLanguageProvider);

    languageToggleValue = !appLanguage.isEnglishLocale;

    print("languageToggleValue $languageToggleValue");
  }

  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    final sharedUtility = ref.read(sharedUtilityProvider);
    final appLanguage = ref.read(appLanguageProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: 'Settings',
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.close,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext listContext, int index) {
          switch (index) {
            case 0:
              return ListTile(
                leading: Icon(Icons.language),
                title: Text('Konkani'),
                trailing: Switch(
                  value: languageToggleValue,
                  onChanged: (bool value) {
                    setState(() {
                      languageToggleValue = value;
                      if (value) {
                        appLanguage.changeLanguage(
                          type: 'kn',
                          country: '',
                        );
                      } else {
                        appLanguage.changeLanguage(
                          type: 'en',
                          country: 'US',
                        );
                      }
                    });
                  },
                  activeColor: utility.darkGradientShadecolor,
                ),
              );
            default:
              return ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text("Dark Mode"),
                trailing: Switch(
                  value: darkModeToggleValue,
                  onChanged: (bool value) {
                    setState(() {
                      darkModeToggleValue = value;
                      sharedUtility.setIsDarkModeEnabled(isEnabled: value);
                    });
                  },
                  activeColor: utility.darkGradientShadecolor,
                ),
              );
          }
        },
        separatorBuilder: (BuildContext listContext, int index) {
          return Divider(
            height: 0.2,
            color: Colors.grey,
          );
        },
        itemCount: 2,
      ),
    );
  }
}
