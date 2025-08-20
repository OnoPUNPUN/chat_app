import 'package:chat_app/widgets/my_buttons.dart';
import 'package:chat_app/widgets/my_textfeild.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  // Email & passowrd controller
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final TextEditingController _confirmPasswordTEcontroller = TextEditingController();

  // tap to go another rounte
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  // Register method
  void register () {

  }

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
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25,),
            // email textfeild
            MyTextfeild(
              hintText: 'Email',
              obscureText: false,
              controller: _emailTEcontroller
            ),

            const SizedBox(height: 10,),
            
            // password textfeild
            MyTextfeild(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordTEcontroller
            ),

            const SizedBox(height: 10,),

            // confirm password
            MyTextfeild(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPasswordTEcontroller
            ),

            const SizedBox(height: 25,),
        
            // login button
            MyButtons(buttonTitle: 'Register', onTap: (){},),

            const SizedBox(height: 25,),
        
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Alredy Have an account?", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(" Login Now", style: TextStyle(
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