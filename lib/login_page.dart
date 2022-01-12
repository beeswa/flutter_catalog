import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "LoginPage",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}
