import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
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
  );
  Place place2 = Place(
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    imageURL:
        'https://www.travelmanagers.com.au/wp-content/uploads/2012/08/AdobeStock_254529936_Railroad-to-Denali-National-Park-Alaska_750x500.jpg',
    likes: 321,
  );

  ProfilePlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: userBloc.placesStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Column(
                    children: userBloc.buildPlacesFirestore(snapshot.data));
              }
              return const CircularProgressIndicator();
            case ConnectionState.active:
              if (snapshot.hasData) {
                return Column(
                    children:
                        userBloc.buildPlacesFirestore(snapshot.data.docs));
              }
              return const CircularProgressIndicator();
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


// Column(
        //   children: <Widget>[
        //     ProfilePlace(place),
        //     ProfilePlace(place2),
        //   ],
        // ),