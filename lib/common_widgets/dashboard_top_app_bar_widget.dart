import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardTopAppBarWidget extends ConsumerWidget {
  const DashboardTopAppBarWidget({
    Key? key,
    required Function showSettings,
    required String title,
  })  : _title = title,
        _showSettings = showSettings,
        super(key: key);

  final Function _showSettings;
  final String _title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            utility.darkGradientShadecolor,
            utility.darkGradientShadecolor,
            utility.lightGradientShadecolor,
          ],
        ),
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 1.0,
                ),
                child: Text(
                  _title,
                  style: TextStyle(
                      fontSize: 21,
                      color: utility.headerTitleTextColor,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () => _showSettings(),
              child: Icon(
                Icons.settings,
                size: 35,
                color: utility.headerTitleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
