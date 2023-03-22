import 'package:flutter/material.dart';

class NewTaskCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const NewTaskCustom(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFe7e6f5),
        ),
      ),
    );
  }
}
