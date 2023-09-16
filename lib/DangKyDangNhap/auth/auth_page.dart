import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/DangKyDangNhap/page/signup_page.dart';
import '/DangKyDangNhap/page/login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return SignupPage(
        // danhdau: false,
        // nhandien: 'ok',
        showLoginPage: toggleScreens,
        // name: TextEditingController(text: ''),
        // age: TextEditingController(text: ''),
        // email: TextEditingController(text: ''),
        // text: ''
      );
    }
  }
}
