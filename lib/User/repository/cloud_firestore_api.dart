import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/model/user.dart';

class CloudFirestoreAPI {
  static const String users = "users";
  static const String places = "places";

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
      'userOwner':
          currenUserID != null ? "$users/$currenUserID" : '', //reference
      'imageURL': place.imageURL,
    });
  }
}
