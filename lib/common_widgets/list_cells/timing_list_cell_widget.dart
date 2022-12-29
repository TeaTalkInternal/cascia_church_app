import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cascia_church_app/providers/app_providers.dart';

class TimingListCellWidget extends ConsumerWidget {
  const TimingListCellWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.timing,
      required this.onTap})
      : super(key: key);

  final String title;
  final String description;
  final String timing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utility = ref.read(utilityProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        // elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: title.isNotEmpty,
                      child: Text(
                        title.toUpperCase(),
                        maxLines: 5,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      timing,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     SizedBox(
              //       width: 70,
              //       child: Text(
              //         description,
              //         style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.w400,
              //             color: utility.bodyTitleTextColor),
              //       ),
              //     ),
              //     const Icon(
              //       Icons.arrow_forward_ios,
              //       size: 15,
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
