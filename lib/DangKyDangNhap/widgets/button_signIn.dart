import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../ThoiTiet/pages/weather/weather.dart';

class ButtonSignIn extends StatefulWidget {
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const ButtonSignIn({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.text,
  }) : super(key: key);

  @override
  State<ButtonSignIn> createState() => _ButtonSignIn();
}

class _ButtonSignIn extends State<ButtonSignIn> {
  void ThongBao(String _errorMessage) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông Báo'),
          content: Text(_errorMessage),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future signIn() async {
    //loading circle
    String _errorMessage = '';
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeatherPage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _errorMessage = 'Người dùng không tồn tại.';

          Navigator.of(context).pop();
          ThongBao(_errorMessage);
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _errorMessage = 'Mật khẩu không chính xác.';

          Navigator.of(context).pop();
          ThongBao(_errorMessage);
        });
      } else {
        setState(() {
          _errorMessage = 'Lỗi đăng nhập: ${e.message}';

          Navigator.of(context).pop();
          ThongBao(_errorMessage);
        });
      }

      // Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _errorMessage = 'Lỗi đăng nhập: $e';
        Navigator.of(context).pop();
        ThongBao(_errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: signIn,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 45, 188),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
