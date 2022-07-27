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
            id: place.id,
            liked: p["liked"],
            name: p["name"],
            description: p["description"],
            imageURL: p["imageURL"],
            likes: p["likes"])));
      }
    }
    return profilePlaces;
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, AppUser user) {
    List<Place> places = <Place>[];

    for (var placeS in placesListSnapshot) {
      if (placeS.data() != null) {
        final p = placeS.data() as Map<String, dynamic>;
        Place place = Place(
            id: placeS.id,
            name: p["name"],
            description: p["description"],
            imageURL: p["imageURL"],
            liked: p["liked"]);
        List usersLikedRefs = p["usersLiked"] ?? [];
        place.liked = false;
        for (var drUL in usersLikedRefs) {
          if (user.uid == drUL.id) {
            place.liked = true;
          }
        }

        places.add(place);
      }
    }
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(places)
        .doc(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      final doc = ds.data() as Map<String, dynamic>;
      int likes = doc['likes'];

      _db.collection(places).doc(place.id).update({
        'likes': place.liked! ? likes + 1 : likes - 1,
        'liked': place.liked! ? true : false,
        'usersLiked': place.liked!
            ? FieldValue.arrayUnion([_db.doc("$users/$uid")])
            : FieldValue.arrayRemove([_db.doc("$users/$uid")])
      });
    });
  }
}
