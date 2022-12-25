import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/app_providers.dart';

class SingleLineListTileWidget extends ConsumerWidget {
  const SingleLineListTileWidget(
      {Key? key,
      required this.title,
      required this.imageName,
      this.isNetworkImage = false,
      required this.onTap})
      : super(key: key);

  final String title;
  final String imageName;
  final bool isNetworkImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        // elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              ClipOval(
                // borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.blue[50],
                  height: 75,
                  width: 75,
                  child: isNetworkImage
                      ? FadeInImage.assetNetwork(
                          placeholder: utility.getImageNameWithBasePath(
                              imageName: 'loader.gif'),
                          image: imageName,
                          fit: BoxFit.contain,
                          placeholderScale: 0.001,
                        )
                      : Image.asset(
                          imageName,
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: utility.bodyTitleTextColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
