import 'dart:io';

import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  const CardImageWithFabIcon({
    Key? key,
    required this.pathImage,
    required this.width,
    required this.height,
    required this.onPressedFabIcon,
    required this.iconData,
    this.left = 20,
  }) : super(key: key);

  final String pathImage;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(left: left),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: _getImage(pathImage)),
    );

    return Stack(
      alignment: const Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          onPressed: onPressedFabIcon,
          icon: iconData,
        )
      ],
    );
  }

  Widget _getImage(String imagePath) {
    if (pathImage.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/img/jar-loading.gif'),
        image: NetworkImage(pathImage),
        fit: BoxFit.cover,
      );
    } else if (pathImage.startsWith('assets')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/img/jar-loading.gif'),
        image: AssetImage(pathImage),
        fit: BoxFit.cover,
      );
    } else {
      return Image.file(
        File(pathImage),
        fit: BoxFit.cover,
      );
    }
  }
}
