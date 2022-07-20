import 'package:flutter/material.dart';
import 'package:trips_app/widgets/gradient_back.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack('', MediaQuery.of(context).size.height),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome \n This is your Travel App",
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SignInButton(Buttons.Google, onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}
