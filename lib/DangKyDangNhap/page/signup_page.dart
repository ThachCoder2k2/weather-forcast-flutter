import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../models/errorMessage.dart' as globals;

import '../widgets/button_signup.dart';
import '/DangKyDangNhap/widgets/custom_textfield.dart';
import '../widgets/button_signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  // const SignupPage({Key? key, required this.text}) : super(key: key);
  final VoidCallback showLoginPage;
  // final TextEditingController name;
  // final TextEditingController age;
  // final TextEditingController email;
  // final bool danhdau;
  // final String nhandien;
  // final String text;
  const SignupPage({
    Key? key,
    // required this.danhdau,
    // required this.nhandien,
    required this.showLoginPage,
    // required this.name,
    // required this.age,
    // required this.email,
    // required this.text
  }) : super(key: key);
  @override
  State<SignupPage> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimpasswordController = TextEditingController();

  @override
  void dispose() {
    // widget.nhandien;
    nameController.dispose();
    ageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confimpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.cloud,
                  size: 100,
                  color: Color.fromARGB(255, 55, 149, 225),
                ),
                Text(
                  'Hello You',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                SizedBox(height: 50),
                CustomTextField(
                  // controller:
                  //     widget.danhdau == false ? nameController : widget.name,
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  // controller:
                  //     widget.danhdau == false ? ageController : widget.age,
                  controller: ageController,
                  hintText: 'Age',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  // controller:
                  //     widget.danhdau == false ? emailController : widget.email,
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                // SizedBox(height: 20),
                // Text(
                //   widget.nhandien == 'email' ? widget.text : '',
                //   style: TextStyle(color: Colors.red),
                // ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                // SizedBox(height: 20),
                // Text(
                //   widget.nhandien == 'm' ? widget.text : '',
                //   style: TextStyle(color: Colors.red),
                // ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: confimpasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ButtonSignUp(
                  nameController: nameController,
                  ageController: ageController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confimpasswordController: confimpasswordController,
                  text: 'Sign Up',
                  // ontapp: signIn,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am a member!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
