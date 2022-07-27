import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';

class ProfilePlacesList extends StatelessWidget {
  const ProfilePlacesList({Key? key, required this.user}) : super(key: key);

  final AppUser user;

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: const EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: StreamBuilder(
        stream: userBloc.myPlacesListStream(user.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.none:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Column(
                    children: userBloc.buildMyPlacesFirestore(snapshot.data));
              }
              return const CircularProgressIndicator();
            case ConnectionState.active:
              if (snapshot.hasData) {
                return Column(
                    children:
                        userBloc.buildMyPlacesFirestore(snapshot.data.docs));
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
