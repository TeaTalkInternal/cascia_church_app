import 'package:flutter/material.dart';

import '../../dashboard/widgets/top_app_bar_widget.dart';

class TimingsPageWidget extends StatelessWidget {
  const TimingsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: TopAppBarWidget(
          title: 'TIMINGS',
          toggleNavigation: () {},
          iconData: Icons.arrow_back_ios,
        ),
      ),
      body: Container(),
    );
  }
}
