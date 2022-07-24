import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/Place/ui/widgets/text_input_location.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/text_input.dart';
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
    final _controllerTitlePLace = TextEditingController();
    final _controllerDescriptionPLace = TextEditingController();
    final _controllerLocationPLace = TextEditingController();
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
          ),
          Container(
            margin: const EdgeInsets.only(top: 120, bottom: 20),
            child: ListView(
              children: [
                Container(),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextInput(
                    hintText: 'Title',
                    inputType: TextInputType.text,
                    maxLines: 1,
                    controller: _controllerTitlePLace,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextInput(
                    hintText: 'Description',
                    inputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPLace,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextInputLocation(
                      hintText: 'Add Location',
                      icon: Icons.location_on_outlined,
                      controller: _controllerLocationPLace),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
