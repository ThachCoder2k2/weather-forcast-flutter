import 'package:flutter/material.dart';

import '../page/forgot_password_page.dart';

class ButtonFogetPassword extends StatelessWidget {
  String text;

  ButtonFogetPassword({required this.text});
  // CustomTextField({required this.hintText, this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForgotPasswordPage();
                  },
                ),
              );
            },
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
