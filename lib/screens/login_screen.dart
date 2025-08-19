import 'package:chat_app/widgets/my_buttons.dart';
import 'package:chat_app/widgets/my_textfeild.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  // Email & passowrd controller
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();


  LoginScreen({super.key});

  //login method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message, 
              size: 60,
              color: Theme.of(context).colorScheme.primary,

            ),

            const SizedBox(height: 50,),
        
            // welcome back message
            Text(
              "Welcome Back You've missed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25,),
            // email textfeild
            MyTextfeild(hintText: 'Email', obscureText: false, controller: _emailTEcontroller,),

            const SizedBox(height: 10,),
            
            // password textfeild
            MyTextfeild(hintText: 'Password', obscureText: true, controller: _passwordTEcontroller,),

            const SizedBox(height: 25,),
        
            // login button
            MyButtons(buttonTitle: 'Login', onTap: login,),

            const SizedBox(height: 25,),
        
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(" Register now", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
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