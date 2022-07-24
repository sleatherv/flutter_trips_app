import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen({Key? key, this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          const GradientBack(
            height: 300,
            title: '',
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, left: 25),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      )),
                ),
              ),
              Flexible(
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.only(top: 45, left: 20, right: 10),
                  child: const TitleHeader(title: 'Add a new place'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
