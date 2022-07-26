import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/Place/ui/widgets/text_input_location.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/widgets/button_purple.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:trips_app/widgets/text_input.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File? image;

  const AddPlaceScreen({Key? key, this.image}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
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
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image != null
                        ? widget.image!.path
                        : 'assets/img/no-image.png', //widget.image!.path,
                    iconData: Icons.camera_alt,
                    width: screenWidth * 0.90,
                    height: 250,
                    onPressedFabIcon: () {},
                    left: 0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                ),
                SizedBox(
                  width: 70,
                  child: ButtonPurple(
                    buttonText: 'Add Place',
                    onPressed: () async {
                      //Firebase storage
                      ///url
                      //user id
                      User? currentUser = userBloc.currentUser;
                      if (currentUser != null && widget.image != null) {
                        String userUid = currentUser.uid;
                        String path =
                            "$userUid/${DateTime.now().toString()}.jpg";
                        userBloc
                            .uploadFileToStorage(path, widget.image!)
                            .then((UploadTask storageUploadTask) {
                          storageUploadTask.then((TaskSnapshot snapshot) {
                            snapshot.ref.getDownloadURL().then((imageURL) {
                              //Cloud Firestore
                              ///Place - title, description, url...
                              userBloc
                                  .updatePlaceData(Place(
                                      name: _controllerTitlePLace.text,
                                      description:
                                          _controllerDescriptionPLace.text,
                                      imageURL: imageURL,
                                      likes: 0))
                                  .whenComplete(() {
                                Navigator.pop(context);
                              });
                            });
                          });
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
