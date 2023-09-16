import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../page/signup_page.dart';

class ButtonSignUp extends StatefulWidget {
  final String text;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confimpasswordController;

  ButtonSignUp({
    Key? key,
    required this.nameController,
    required this.ageController,
    required this.emailController,
    required this.passwordController,
    required this.confimpasswordController,
    required this.text,
  }) : super(key: key);

  @override
  State<ButtonSignUp> createState() => _ButtonSignUp();
}

class _ButtonSignUp extends State<ButtonSignUp> {
  // bool showLoginPage = true;

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

  String _errorMessage = '';

  Future signUp() async {
    try {
      final String email = widget.emailController.text.trim();
      final String password = widget.passwordController.text.trim();

      if (!email.contains('@') || !email.contains('.')) {
        setState(() {
          _errorMessage = 'Định dạng email không hợp lệ.vd: thinh@gmail.com';

          ThongBao(_errorMessage);
        });
        return;
      }

      if (password.length < 6) {
        setState(() {
          _errorMessage = 'Mật khẩu phải chứa ít nhất 6 ký tự.';
          ThongBao(_errorMessage);
        });
        return;
      }

      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.emailController.text.trim(),
          password: widget.passwordController.text.trim(),
        );

        addUserDetails(
          widget.nameController.text.trim(),
          int.parse(widget.ageController.text.trim()),
          widget.emailController.text.trim(),
          widget.passwordController.text.trim(),
        );

        setState(() {
          ThongBao('Bạn đã đăng ký thành công.');
        });
      } else {
        setState(() {
          ThongBao('Mật khẩu không khớp.');
        });
      }

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => HomeScreen()),
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'Email đã được sử dụng bởi người dùng khác.';
          ThongBao(_errorMessage);
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          _errorMessage = 'Mật khẩu không đủ mạnh.';
          ThongBao(_errorMessage);
        });
      } else {
        setState(() {
          _errorMessage = 'Lỗi đăng ký: ${e.message}';

          ThongBao(_errorMessage);
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Lỗi đăng ký: $e';
        ThongBao(_errorMessage);
      });
    }
  }

  Future addUserDetails(
      String name,
      int age,
      String email,
      String password,
      ) async {
    await FirebaseFirestore.instance.collection('users1').add({
      'name': name,
      'age': age,
      'email': email,
      'password': password,
    });
  }

  bool passwordConfirmed() {
    if (widget.passwordController.text.trim() ==
        widget.confimpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
        onTap: signUp,
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
