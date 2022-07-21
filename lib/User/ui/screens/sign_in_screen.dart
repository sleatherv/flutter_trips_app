import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/User/bloc/bloc_user.dart';
import 'package:trips_app/User/model/user.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:trips_app/platzi_trips_cupertino.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // snapshot - data - Object User?
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleUI();
          } else {
            return const PlatziTripsCupertino();
          }
        });
  }

  Widget signInGoogleUI() {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(title: '', height: MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: screenWidth,
                  child: const Text("Welcome \n This is your Travel App",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: "Lato",
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              SignInButton(Buttons.Google, onPressed: () {
                // userBloc.signOut();
                userBloc.signIn().then((user) {
                  userBloc.updateUserData(AppUser(
                      uid: user.additionalUserInfo?.profile!['id'],
                      name: user.additionalUserInfo?.profile!['name'],
                      email: user.additionalUserInfo?.profile!['email'],
                      photoURL: user.additionalUserInfo?.profile!['picture']));
                });
              })
            ],
          )
        ],
      ),
    );
  }
}
