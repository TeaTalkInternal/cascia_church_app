import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/app_providers.dart';

class ContactsLineListTileWidget extends ConsumerWidget {
  const ContactsLineListTileWidget(
      {Key? key,
      required this.title,
      required this.mobileNumber,
      required this.landlineNumber,
      required this.onTap})
      : super(key: key);

  final String title;
  final String mobileNumber;
  final String landlineNumber;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
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
              InkWell(
                onTap: () => {},
                child: Image.asset(
                  'assets/images/mobile-number.png',
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () => {},
                child: Image.asset(
                  'assets/images/landline-number.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
