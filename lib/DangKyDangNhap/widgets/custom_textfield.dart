import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  CustomTextField(
      {required this.controller,
      required this.hintText,
      this.obscureText = false});
  // CustomTextField({required this.hintText, this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      // child: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.grey[200],
      //     border: Border.all(color: Colors.white),
      //     borderRadius: BorderRadius.circular(12),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 20.0),
      //     child: TextField(
      //       obscureText: true,
      //       decoration: InputDecoration(
      //         border: InputBorder.none,
      //         hintText: hintText,
      //       ),
      //     ),
      //   ),
      // ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}
