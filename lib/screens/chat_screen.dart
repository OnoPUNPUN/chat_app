import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String recviverEmail;

  const ChatScreen({super.key, required this.recviverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(recviverEmail)));
  }
}
