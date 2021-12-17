import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopAppBarWidget extends ConsumerWidget {
  const TopAppBarWidget({
    Key? key,
    required Function toggleNavigation,
    required String title,
    required IconData iconData,
  })  : _title = title,
        _toggleNavigation = toggleNavigation,
        _iconData = iconData,
        super(key: key);

  final Function _toggleNavigation;
  final String _title;
  final IconData _iconData;

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
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            utility.darkGradientShadecolor,
            utility.darkGradientShadecolor,
            utility.lightGradientShadecolor,
          ],
        ),
      ),
      height: 95.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => _toggleNavigation(),
              child: Icon(
                _iconData,
                size: 30,
                color: utility.headerTitleTextColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              _title,
              style: TextStyle(
                fontSize: 21,
                color: utility.headerTitleTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
