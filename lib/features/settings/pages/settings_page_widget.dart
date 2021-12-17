import 'package:cascia_church_app/features/dashboard/widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('settings'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.close,
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext listContext, int index) {
          switch (index) {
            case 0:
              return SwitchListTileWidget(
                  toggleValue: languageToggleValue,
                  title: AppLocalizations.of(context)!.translate(
                    'display_in_konkani',
                  ),
                  iconData: Icons.language,
                  toggleMethod: _languageModeToggled);
            default:
              return SwitchListTileWidget(
                  toggleValue: darkModeToggleValue,
                  title: AppLocalizations.of(context)!.translate(
                    'dark_mode',
                  ),
                  iconData: Icons.dark_mode,
                  toggleMethod: _darkModeToggled);
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

  void _darkModeToggled(bool value) {
    final sharedUtility = ref.read(sharedUtilityProvider);
    setState(() {
      darkModeToggleValue = value;
      sharedUtility.setIsDarkModeEnabled(isEnabled: value);
    });
  }

  void _languageModeToggled(bool value) {
    final appLanguage = ref.read(appLanguageProvider);
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
  }
}

class SwitchListTileWidget extends ConsumerWidget {
  const SwitchListTileWidget(
      {Key? key,
      required this.toggleValue,
      required this.title,
      required this.iconData,
      required this.toggleMethod})
      : super(key: key);

  final bool toggleValue;
  final String title;
  final IconData iconData;
  final void Function(bool) toggleMethod;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return ListTile(
      minVerticalPadding: 25,
      leading: ClipOval(
        child: Container(
          color: utility.lightGradientShadecolor.withOpacity(0.2),
          padding: const EdgeInsets.all(8),
          child: Icon(
            iconData,
            color: utility.darkGradientShadecolor,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Switch(
        value: toggleValue,
        onChanged: toggleMethod,
        activeColor: utility.darkGradientShadecolor,
      ),
    );
  }
}
