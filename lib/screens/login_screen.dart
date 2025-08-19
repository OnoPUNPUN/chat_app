import 'package:chat_app/widgets/my_textfeild.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            MyTextfeild(),
        
            // password textfeild
        
            // login button
        
            // register now
          ],
        ),
      ),
    );
  }
}