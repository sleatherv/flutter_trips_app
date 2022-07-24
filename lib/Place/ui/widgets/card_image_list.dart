import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 300;
    double height = 250;
    double left = 20.0;
    return SizedBox(
      height: 350.0,
      child: ListView(
        padding: const EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: [
          CardImageWithFabIcon(
            pathImage: "assets/img/beach_palm.jpeg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            onPressedFabIcon: () {},
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/mountain.jpeg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            onPressedFabIcon: () {},
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/mountain_stars.jpeg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            onPressedFabIcon: () {},
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/river.jpeg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            onPressedFabIcon: () {},
            left: left,
          ),
          CardImageWithFabIcon(
            pathImage: "assets/img/sunset.jpeg",
            iconData: Icons.favorite_border,
            width: width,
            height: height,
            onPressedFabIcon: () {},
            left: left,
          ),
        ],
      ),
    );
  }
}
