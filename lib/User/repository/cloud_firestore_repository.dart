import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(AppUser user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
}
