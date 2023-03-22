import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldCustom(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
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
