import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/widgets/gradient_back.dart';

class AddPlaceScreen extends StatefulWidget {
  File? image;

  AddPlaceScreen({Key? key, this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
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
                      icon: const Icon(Icons.keyboard_arrow_left)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
