import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContactsLineListTileWidget extends ConsumerWidget {
  const ContactsLineListTileWidget(
      {Key? key,
      required this.title,
      required this.isGurkar,
      required this.mobileNumber,
      required this.landlineNumber,
      required this.onTap})
      : super(key: key);

  final String title;
  final bool isGurkar;
  final String mobileNumber;
  final String landlineNumber;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    final titles = title.split("/");
    final familyHeadName = (titles.length > 0) ? titles[0] : "";
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
            vertical: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        child: Text(
                          "Gurkar",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        ),
                      ),
                      visible: isGurkar,
                    ),
                    Text(
                      familyHeadName,
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
              // InkWell(
              //   onTap: () => {},
              //   child: Image.asset(
              //     'assets/images/mobile-number.png',
              //     height: 30,
              //     width: 30,
              //   ),
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              // InkWell(
              //   onTap: () => {},
              //   child: Image.asset(
              //     'assets/images/landline-number.png',
              //     height: 30,
              //     width: 30,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
