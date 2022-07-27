import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/Place/ui/widgets/card_image.dart';
import 'package:trips_app/User/model/user.dart';

class CardImageList extends StatefulWidget {
  const CardImageList({Key? key, required this.user}) : super(key: key);
  final AppUser user;
  @override
  State<CardImageList> createState() => _CardImageListState();
}

class _CardImageListState extends State<CardImageList> {
  late UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
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
                return _listViewPlaces(userBloc.buildPlacesFirestore(
                    snapshot.data.docs, widget.user));
              case ConnectionState.active:
                return _listViewPlaces(userBloc.buildPlacesFirestore(
                    snapshot.data.docs, widget.user));
              default:
                return const CircularProgressIndicator();
            }
          },
        ));
  }

  Widget _listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked!;
        userBloc.likePlace(place, widget.user.uid);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
      padding: const EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: places.map((place) {
        return CardImageWithFabIcon(
          pathImage: place.imageURL,
          width: 300.0,
          height: 250.0,
          left: 20.0,
          iconData: place.liked == true ? iconDataLiked : iconDataLike,
          onPressedFabIcon: () {
            setLiked(place);
          },
          internet: true,
        );
      }).toList(),
    );
  }
}
