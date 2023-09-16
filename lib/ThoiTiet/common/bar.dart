import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text(
        '|',
        style: TextStyle(
          fontSize: 21,
          color: Colors.white,
        ),
      ),
    );
  }
}
