import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/auth_repository.dart';
import 'package:trips_app/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  //Data Flow
  //Stream Firebase
  //StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;
  User? get currentUser => FirebaseAuth.instance.currentUser;

  //Use cases
  //Sign in will be general
  Future<UserCredential> signIn() async {
    return await _authRepository.signInFirebase();
  }

  //Sign Out
  signOut() {
    _authRepository.signOut();
  }

  //2. Register User in DB
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(AppUser user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  //Register place in DB
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  final _firebaseStorageRepository = FirebaseStorageRepository();
  Future<UploadTask> uploadFileToStorage(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {}
}
