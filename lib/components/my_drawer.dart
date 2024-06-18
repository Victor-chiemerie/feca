import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    // log out
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Text(
              "Navigation",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: colorScheme.tertiary,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            SizedBox(
              height: deviceHeight * 0.85,
              child: ListView(
                children: [
                  myListTile(
                    context,
                    Icons.menu_book_outlined,
                    colorScheme.secondary,
                    'Redeemers Training Course (RTC)',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.follow_the_signs_outlined,
                    Colors.grey[600],
                    'Outreaches and Follow Up',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.people,
                    Colors.grey[600],
                    'National Executives (From Inception till date)',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.calendar_month_rounded,
                    Colors.blue[300],
                    'Conventions (From Inception till date)',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.map,
                    Colors.teal[600],
                    'Region and Zones',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.admin_panel_settings,
                    Colors.red[400],
                    'ADMIN UPLOAD',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.help_outline,
                    Colors.blue[200],
                    'About',
                    () {},
                  ),
                  myListTile(
                    context,
                    Icons.logout_outlined,
                    colorScheme.secondary,
                    'Log Out',
                    logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myListTile(
    BuildContext context,
    IconData myIcon,
    Color? iconColor,
    String title,
    void Function()? myOnTap,
  ) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: colorScheme.tertiary),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        horizontalTitleGap: 30,
        leading: Icon(
          myIcon,
          size: 40,
          color: iconColor,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorScheme.tertiary,
            fontSize: 14,
          ),
        ),
        onTap: myOnTap,
      ),
    );
  }
}
