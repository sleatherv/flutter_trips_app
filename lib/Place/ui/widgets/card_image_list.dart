import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return SizedBox(
        height: 350.0,
        child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.none:
                return const CircularProgressIndicator();
              case ConnectionState.done:
                return _listViewPlaces(
                    userBloc.buildPlacesFirestore(snapshot.data.docs));
              case ConnectionState.active:
                return _listViewPlaces(
                    userBloc.buildPlacesFirestore(snapshot.data.docs));
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }

  Widget _listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
