import 'package:appwriteauth/screens/changemail.dart';
import 'package:appwriteauth/screens/realtime_screen.dart';
import 'package:appwriteauth/screens/updatePassword.dart';
import 'package:appwriteauth/screens/uploadimage.dart';
import 'package:appwriteauth/screens/userData.dart';
import 'package:appwriteauth/sessions/currentSession.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/signup.dart';

Map<String, WidgetBuilder> get routesMethod {
  return {
    '/': (context) => const CheckCurrentSession(),
    '/home': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/signup': (context) => const SignupPage(),
    '/changeEmail': (context) => const ChangeEmail(),
    '/updatePassword': (context) => const UpdatePassword(),
    '/insertData': (context) => const UserData(),
    '/uploadImage': (context) => const UploadImage(),
    '/realtime': (context) => const RealtimeScreen(),
  };
}
