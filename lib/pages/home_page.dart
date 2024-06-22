import 'package:feca/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorScheme.tertiary,
        unselectedItemColor: colorScheme.tertiaryFixedDim,
        type: BottomNavigationBarType.shifting,
        elevation: 10,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: colorScheme.surface,
            icon: const Icon(Icons.home),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            backgroundColor: colorScheme.surface,
            icon: const Icon(Icons.hourglass_bottom_outlined),
            label: 'Daily',
          ),
          BottomNavigationBarItem(
            backgroundColor: colorScheme.surface,
            icon: const Icon(Icons.event),
            label: 'Events',
          ),
        ],
      ),
    );
  }
}
