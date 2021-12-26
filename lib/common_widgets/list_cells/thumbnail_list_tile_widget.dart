import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThumbnailListTileWidget extends ConsumerWidget {
  const ThumbnailListTileWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.imageName,
      required this.onTap})
      : super(key: key);

  final String title;
  final String subTitle;
  final String imageName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return GestureDetector(
      onTap: () => onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageName,
                    fit: BoxFit.cover,
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
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: utility.bodyTitleTextColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: utility.appDarkGreyColor),
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
