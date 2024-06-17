import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _auth = AuthService();

  // log out
  void logOut() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
