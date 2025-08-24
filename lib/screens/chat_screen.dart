import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String recviverEmail;

  const ChatScreen({super.key, required this.recviverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          recviverEmail,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
        elevation: 4, // adds shadow for better depth
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16), // nice rounded bottom
          ),
        ),
      ),
    );
  }
}
