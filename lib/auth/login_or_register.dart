import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  // initially will show login screen
  bool showLoginScreen = true;

  // toggel between login and register screen
  void toggleScreen() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginScreen) {
      return LoginScreen(onTap: toggleScreen,);
    } else {
      return RegisterScreen(onTap: toggleScreen,);
    }
  }
}