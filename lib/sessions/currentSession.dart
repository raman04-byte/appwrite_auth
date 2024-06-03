import 'package:appwriteauth/auth/authenticate.dart';
import 'package:flutter/material.dart';

class CheckCurrentSession extends StatefulWidget {
  const CheckCurrentSession({super.key});

  @override
  State<CheckCurrentSession> createState() => _CheckCurrentSessionState();
}

class _CheckCurrentSessionState extends State<CheckCurrentSession> {
  @override
  void initState() {
    super.initState();
    checkSession().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LinearProgressIndicator(),
      )
    );
  }
}