import 'package:flutter/material.dart';

class Place {
  final String? id;
  final String name;
  final String description;
  final String imageURL;
  final int? likes;
  bool? liked;

  Place(
      {Key? key,
      required this.name,
      required this.description,
      required this.imageURL,
      this.likes,
      this.liked,
      this.id});
}
