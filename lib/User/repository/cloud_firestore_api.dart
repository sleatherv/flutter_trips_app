import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:trips_app/User/model/user.dart';

class CloudFirestoreAPI {
  static const String users = "users";
  static const String places = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(AppUser user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    });
  }
}
