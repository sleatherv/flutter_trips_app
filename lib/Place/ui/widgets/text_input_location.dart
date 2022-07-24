import 'package:flutter/material.dart';

class TextInputLocation extends StatelessWidget {
  const TextInputLocation(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.icon})
      : super(key: key);

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Icon(icon),
            fillColor: const Color(0xffffffff),
            filled: true,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffffffff)),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffffffff)),
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
      decoration: const BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0.0, 7))
      ]),
    );
  }
}
