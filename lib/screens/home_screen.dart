import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:chat_app/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.surface),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users expect for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        // error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        // return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userdata) => _buildUserListItem(userdata, context))
              .toList(),
        );
      },
    );
  }

  // build individual list title for user
  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    //display all user expect the current user
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(recviverEmail: userData["email"]),
          ),
        );
      },
    );
  }
}
