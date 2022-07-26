import 'package:flutter/material.dart';
import 'package:trips_app/Place/model/place.dart';
import 'package:trips_app/User/ui/widgets/profile_place_info.dart';

class ProfilePlace extends StatelessWidget {
  final Place place;

  const ProfilePlace(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photoCard = Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 70.0),
      height: 220.0,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/jar-loading.gif'),
          image: NetworkImage(place.imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );

    return Stack(
      alignment: const Alignment(0.0, 0.8),
      children: <Widget>[photoCard, ProfilePlaceInfo(place)],
    );
  }
}
