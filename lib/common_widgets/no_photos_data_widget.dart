//Sub Widgets
import 'package:flutter/material.dart';

class NoPhotosDataWidget extends StatelessWidget {
  NoPhotosDataWidget({
    required this.noPhotosMessage,
    required this.refreshWidget,
    Key? key,
  }) : super(key: key);

  final String noPhotosMessage;
  final Function refreshWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(
            noPhotosMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        IconButton(
          onPressed: () => refreshWidget(),
          icon: const Icon(
            Icons.refresh,
            size: 35.0,
          ),
        )
      ],
    );
  }
}
