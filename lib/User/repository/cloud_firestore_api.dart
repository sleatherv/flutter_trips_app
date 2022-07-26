import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/widgets/profile_place.dart';

class CloudFirestoreAPI {
  final String users = "users";
  final String places = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(AppUser user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);

    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    });
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(places);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    String? currenUserID = _auth.currentUser?.uid;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': currenUserID != null
          ? _db.doc("$users/$currenUserID")
          : '', //reference
      'imageURL': place.imageURL,
    }).then((DocumentReference docReference) {
      docReference.get().then((DocumentSnapshot snapshot) {
        //id place reference Array
        DocumentReference placeRef = snapshot.reference;
        DocumentReference refUsers = _db.collection(users).doc(currenUserID);
        refUsers.update({
          "myPlaces": FieldValue.arrayUnion([placeRef])
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = <ProfilePlace>[];
    for (var place in placesListSnapshot) {
      if (place.data() != null) {
        final p = place.data() as Map<String, dynamic>;
        profilePlaces.add(ProfilePlace(Place(
            name: p["name"],
            description: p["description"],
            imageURL: p["imageURL"],
            likes: p["likes"])));
      }
    }
    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> profilePlaces = <CardImageWithFabIcon>[];

    double height = 250;
    double width = 300;
    double left = 20;

    IconData iconData = Icons.favorite_border;
    for (var place in placesListSnapshot) {
      if (place.data() != null) {
        final p = place.data() as Map<String, dynamic>;

        profilePlaces.add(CardImageWithFabIcon(
          height: height,
          width: width,
          pathImage: p["imageURL"],
          onPressedFabIcon: () {},
          left: left,
          iconData: iconData,
        ));
      }
    }
    return profilePlaces;
  }
}
