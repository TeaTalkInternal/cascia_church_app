import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileNameThumbnailListTileWidget extends ConsumerWidget {
  const ProfileNameThumbnailListTileWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      this.imageSize = 65,
      this.isArrowVisible = true,
      required this.onTap})
      : super(key: key);

  final String title;
  final String subTitle;
  final double imageSize;
  final bool isArrowVisible;
  final void Function() onTap;

  /*
      "name": "Msgr. Francis  Xavier Fernandes",
      "nameKn": "Msgr. ಫ್ರಾನ್ಸಿಸ್ ಕ್ಸೇವಿಯರ್ ಫೆರ್ನಾಂಡಿಸ್",
    },
    {
      "name": "Fr. A. J. Silva",
      "nameKn": "ಬಾಪ್. ಎ.ಜೆ.ಸಿಲ್ವಾ",
  */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final frName = title.replaceAll('Fr. ', '');
    print("frName $frName");
    final frKNName = frName.replaceAll('ಬಾಪ್. ', '');
    print("frKNName $frKNName");
    final msgNameKN = frKNName.replaceAll('ಮಾ| ', '');
    final msgName = msgNameKN.replaceAll('Msgr. ', '');
    print("msgName $msgName");
    // final titleNames = title.split(' ');
    // final lastName = (titleNames.length >= 2) ? titleNames[1] : '';
    // final messengerName = (titleNames.length >= 1) ? titleNames[0] : '';
    // final messengerNames = messengerName.split('.');
    // final firstName = (messengerNames.length >= 2) ? messengerNames[1] : '';
    // final fullName = firstName + lastName;
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
              SizedBox(
                height: imageSize,
                width: imageSize,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ProfilePicture(
                    name: msgName,
                    radius: 31,
                    fontsize: 21,
                    random: true,
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
              Visibility(
                visible: isArrowVisible,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
