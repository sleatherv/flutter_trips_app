import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';
import 'profile_place.dart';
import '../../../Place/model/place.dart';

class ProfilePlacesList extends StatelessWidget {
  Place place = Place(
      name: 'Mountains',
      description: 'Hiking. Water fall hunting. Natural bath',
      imageURL:
          'https://www.travelmanagers.com.au/wp-content/uploads/2012/08/AdobeStock_254529936_Railroad-to-Denali-National-Park-Alaska_750x500.jpg',
      likes: 321,
      userOwner:
          AppUser(uid: 'uid', name: 'Sleather', email: 'S', photoURL: ''));
  Place place2 = Place(
      name: 'Mountains',
      description: 'Hiking. Water fall hunting. Natural bath',
      imageURL:
          'https://www.travelmanagers.com.au/wp-content/uploads/2012/08/AdobeStock_254529936_Railroad-to-Denali-National-Park-Alaska_750x500.jpg',
      likes: 321,
      userOwner:
          AppUser(uid: 'uid', name: 'Sleather', email: 'S', photoURL: ''));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
