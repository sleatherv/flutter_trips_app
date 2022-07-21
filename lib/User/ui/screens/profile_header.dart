import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

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
            case ConnectionState.active:
              return showProfileData(snapshot);
            case ConnectionState.done:
              return showProfileData(snapshot);
          }
        });

    // return
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(children: const [
          CircularProgressIndicator(),
          Text('Cannot see the profile info, please make login.')
        ]),
      );
    } else {
      const title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      AppUser user = AppUser(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL,
          uid: '');

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[title],
            ),
            UserInfo(user: user),
            const ButtonsBar()
          ],
        ),
      );
    }
  }
}
