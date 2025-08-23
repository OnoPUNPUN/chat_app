import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/auth/error_handler.dart';
import 'package:chat_app/widgets/my_buttons.dart';
import 'package:chat_app/widgets/my_textfeild.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();

  final void Function()? onTap;

  LoginScreen({super.key, required this.onTap});

  void login(BuildContext context) async {
    final AuthService authService = AuthService();

    try {
      showLoadingDialog(context);

      await authService.signInWithEmailPassword(
        _emailTEcontroller.text,
        _passwordTEcontroller.text,
      );

      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      String errorMessage = getAuthErrorMessage(
        e.toString().replaceAll("Exception: ", ""),
      );
      showErrorSnackBar(context, errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              "Welcome Back You've missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),
            MyTextfeild(
              hintText: 'Email',
              obscureText: false,
              controller: _emailTEcontroller,
            ),
            const SizedBox(height: 10),
            MyTextfeild(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordTEcontroller,
            ),
            const SizedBox(height: 25),
            MyButtons(buttonTitle: 'Login', onTap: () => login(context)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
