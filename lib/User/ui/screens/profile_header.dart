import 'package:flutter/material.dart';
import 'package:trips_app/User/model/user.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  final AppUser user;
  @override
  Widget build(BuildContext context) {
    const title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0),
    );

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

    // return
  }
}
