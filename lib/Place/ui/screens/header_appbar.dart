import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import '../../../widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.none:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            return showPlacesData(snapshot);
          case ConnectionState.done:
            return showPlacesData(snapshot);
          default:
            return showPlacesData(snapshot);
        }
      },
    );
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(
        children: const [
          GradientBack(title: "Bienvenido", height: 250),
          Text("Usuario no logeado. Haz Login")
        ],
      );
    } else {
      var user = AppUser(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      return Stack(
        children: [
          const GradientBack(
            height: 250.0,
            title: '',
          ),
          CardImageList(
            user: user,
          )
        ],
      );
    }
  }
}
