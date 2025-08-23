import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/auth/error_handler.dart';
import 'package:chat_app/widgets/my_buttons.dart';
import 'package:chat_app/widgets/my_textfeild.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _confirmPasswordTEcontroller =
      TextEditingController();

  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) async {
    final auth = AuthService();

    if (_passwordTEcontroller.text == _confirmPasswordTEcontroller.text &&
        EmailValidator.validate(_emailTEcontroller.text)) {
      try {
        showLoadingDialog(context);

        await auth.signUpWithEmailPassword(
          _emailTEcontroller.text,
          _passwordTEcontroller.text,
        );

        Navigator.pop(context); // close loading
      } catch (e) {
        Navigator.pop(context); // close loading first
        String errorMessage = getAuthErrorMessage(
          e.toString().replaceAll("Exception: ", ""),
        );
        showErrorSnackBar(context, errorMessage);
      }
    } else if (!EmailValidator.validate(_emailTEcontroller.text)) {
      showErrorSnackBar(context, "Enter a valid email address.");
    } else {
      showErrorSnackBar(context, "Passwords didn't match.");
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
              "Let's create an account for you",
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
            const SizedBox(height: 10),
            MyTextfeild(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPasswordTEcontroller,
            ),
            const SizedBox(height: 25),
            MyButtons(buttonTitle: 'Register', onTap: () => register(context)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login Now",
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
