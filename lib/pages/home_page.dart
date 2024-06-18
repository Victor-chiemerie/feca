import 'package:feca/components/my_drawer.dart';
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      drawer: const MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: colorScheme.tertiary,
        ), // Change color to green
        title: Text(
          "FECA DAILY",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colorScheme.tertiary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
    );
  }
}
