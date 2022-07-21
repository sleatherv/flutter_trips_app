import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';

class AppUser {
  final String uid;
  final String name;
  final String email;
  final String photoURL;

  final List<Place>? myFavoritePlaces;
  final List<Place>? myPlaces;

  AppUser({
    Key? key,
    required this.uid,
    required this.name,
    required this.email,
    required this.photoURL,
    this.myFavoritePlaces,
    this.myPlaces,
  });
}
