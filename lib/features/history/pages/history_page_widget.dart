import 'package:cascia_church_app/features/dashboard/widgets/top_app_bar_widget.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPageWidget extends ConsumerWidget {
  const HistoryPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: TopAppBarWidget(
          title: AppLocalizations.of(context)!.translate('History'),
          toggleNavigation: () => Navigator.of(context).pop(),
          iconData: Icons.close,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nibh in mi condimentum pellentesque. Mauris luctus gravida est nec luctus. Phasellus scelerisque quam eget ornare porttitor. Quisque luctus mattis diam, at luctus lacus lobortis eleifend. Integer sed maximus augue. Fusce sit amet commodo leo, vitae placerat mauris. Mauris rhoncus arcu in vestibulum volutpat. Nulla sagittis venenatis nunc. Suspendisse pulvinar sem sit amet arcu vulputate, imperdiet tincidunt lacus consectetur. Maecenas lacus ipsum, venenatis in tristique eu, blandit nec lacus. Vestibulum luctus eget lorem non pharetra. Sed auctor at odio sit amet mattis.\nNunc non lectus efficitur, pulvinar magna nec, vulputate orci. Sed ornare nunc nec mi mollis ultricies. Curabitur aliquet elementum mi, eget dapibus massa laoreet vitae. Maecenas semper nibh quis congue auctor. Nunc vel tincidunt quam, sit amet volutpat orci. Maecenas enim magna, fermentum vel mollis a, malesuada quis nunc. Donec lacinia velit a erat pretium sagittis. Duis euismod in elit ut euismod. Duis quam purus, fringilla at quam id, ornare porttitor ante.\nMauris fermentum blandit massa, vitae auctor nisl finibus ac. Curabitur ultricies consequat tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed vestibulum molestie augue, at mattis felis pretium id. Praesent auctor, justo sed cursus efficitur, metus ligula tincidunt sapien, et tincidunt felis ligula quis diam. Maecenas euismod ultrices pulvinar. Proin sit amet aliquam orci. Vivamus a nunc quis nulla ultricies viverra. Donec tortor leo, suscipit at commodo vel, dapibus et purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nMaecenas nec quam pharetra, rhoncus ipsum non, venenatis eros. Nulla malesuada consectetur quam, ac convallis nibh finibus sed. Morbi laoreet malesuada pharetra. Quisque quis eros mollis, ullamcorper velit vel, volutpat nibh. Sed nulla elit, bibendum ut lorem quis, auctor rhoncus velit. Donec tempus fringilla eros in eleifend. Morbi maximus dolor sed massa congue pharetra. Sed in lacus efficitur magna vestibulum pretium a vel dolor. Morbi justo ante, aliquet et orci dictum, dapibus viverra lorem. Vestibulum tristique turpis mauris, non tempus risus tempor dapibus.",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
