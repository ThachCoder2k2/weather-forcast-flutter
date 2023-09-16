import 'dart:ffi';

import 'package:flutter/material.dart';
import '/DangKyDangNhap/widgets/custom_textfield.dart';
import '../widgets/button_signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class ForgotPasswordPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();

//   void _resetPassword(BuildContext context) {
//     String email = emailController.text;

//     // Xử lý yêu cầu đặt lại mật khẩu ở đây
//     // Gửi yêu cầu đặt lại mật khẩu đến server hoặc xử lý logic tương ứng
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Quên mật khẩu')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // CustomTextField(controller: emailController, hintText: 'Email'),
//             // CustomButton(
//             //     text: 'Đặt lại mật khẩu',
//             //     onPressed: () => _resetPassword(context)),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordResst() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your Email and  we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          MaterialButton(
            onPressed: passwordResst,
            child: Text('Reset Password'),
            color: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}
