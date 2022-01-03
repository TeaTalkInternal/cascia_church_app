import 'package:flutter/material.dart';

class CurvedButtonWidget extends StatelessWidget {
  const CurvedButtonWidget({
    required this.iconName,
    required this.onTap,
    required this.size,
    required this.iconSize,
    required this.leadingOffset,
    Key? key,
  }) : super(key: key);

  final IconData iconName;
  final Function onTap;
  final double size;
  final double iconSize;
  final double leadingOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: InkResponse(
        highlightColor: Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(
            left: leadingOffset,
          ),
          child: Icon(
            iconName,
            color: Colors.black,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
