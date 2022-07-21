import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Change password
            CircleButton(true, Icons.vpn_key_outlined, 20.0,
                const Color.fromRGBO(255, 255, 255, 0.6), () {}),
            CircleButton(false, Icons.add, 40.0,
                const Color.fromRGBO(255, 255, 255, 1), () {}),
            CircleButton(
                true,
                Icons.exit_to_app,
                20.0,
                const Color.fromRGBO(255, 255, 255, 0.6),
                () => userBloc.signOut()),
          ],
        ));
  }
}
