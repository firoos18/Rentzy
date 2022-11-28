import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:rentzy_rpl/auth/main_page.dart';
import 'package:rentzy_rpl/pages/home.dart';
import 'package:rentzy_rpl/auth/login.dart';
import 'package:rentzy_rpl/auth/otp.dart';
import 'package:rentzy_rpl/auth/password_reset.dart';
import 'package:rentzy_rpl/auth/register.dart';
import 'package:rentzy_rpl/pages/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ignore: prefer_const_constructors
  runApp(MaterialApp(
    theme: ThemeData(),
    debugShowCheckedModeBanner: false,
    home: Landing(),
    // ignore: prefer_const_constructors
    // initialRoute: '/login',
    // routes: {
    //   '/': (context) => const MainPage(),
    //   '/login': (context) => const Login(),
    //   '/home': (context) => Home(),
    //   '/register': (context) => Register(),
    //   '/otp': (context) => Otp(),
    //   '/password-reset': (context) => PasswordReset(),
    // },
  ));
}
