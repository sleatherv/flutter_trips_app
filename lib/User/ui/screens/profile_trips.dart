import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/User/ui/screens/profile_header.dart';

import '../widgets/profile_places_list.dart';
import '../widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              return showProfileData(snapshot);
            case ConnectionState.active:
              return showProfileData(snapshot);
            default:
              return const CircularProgressIndicator();
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: <Widget>[
          const ProfileBackground(),
          ListView(
            children: const [Text('User not logged in, please login')],
          ),
        ],
      );
    } else {
      var user = AppUser(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(
        children: <Widget>[
          const ProfileBackground(),
          ListView(
            children: <Widget>[
              ProfileHeader(user: user),
              ProfilePlacesList(user: user)
            ],
          ),
        ],
      );
    }
  }
}
