import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      required this.hintText,
      required this.inputType,
      required this.controller,
      this.maxLines = 1})
      : super(key: key);

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        style: const TextStyle(
            fontSize: 15,
            fontFamily: "Lato",
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFe5e5e5),
            border: InputBorder.none,
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFe5e5e5)),
                borderRadius: BorderRadius.all(Radius.circular(9)))),
      ),
    );
  }
}
