import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';

class Place {
  final String name;
  final String description;
  final String imageURL;
  final int? likes;
  final AppUser? userOwner;

  Place({
    Key? key,
    required this.name,
    required this.description,
    required this.imageURL,
    this.likes,
    this.userOwner,
  });
}
