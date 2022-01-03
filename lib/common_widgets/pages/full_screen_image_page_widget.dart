import 'dart:ui';

import 'package:cascia_church_app/common_widgets/curved_button_widget.dart';
import 'package:cascia_church_app/features/gallery/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenPageWidget extends StatelessWidget {
  const FullScreenPageWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(photo.imageUrl), fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
              ),
            ),
            Hero(
              child: PhotoView(
                imageProvider: NetworkImage(photo.imageUrl),
              ),
              tag: photo.id,
            ),
            Positioned(
              top: 50,
              right: 20,
              child: CurvedButtonWidget(
                iconName: Icons.close,
                onTap: () {
                  Navigator.of(context).pop();
                },
                size: 45,
                iconSize: 33,
                leadingOffset: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
