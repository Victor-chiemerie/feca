import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:feca/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _formattedDateTime;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    // implement initState
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    // implement dispose
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    setState(() {
      DateTime now = DateTime.now();
      _formattedDateTime = DateFormat('MMM d, yyyy - h:mm a').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<Widget> newBody = [
      overViewPage(),
      dailyPage(),
      eventPage(),
    ];

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
      body: newBody[_currentIndex],
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

  Widget overViewPage() {
    final deviceWidth = MediaQuery.of(context).size.width;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius if desired
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 3), // Offset the shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ), // shape the image edges
                    image: DecorationImage(
                      image: AssetImage("images/overview1.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.5,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "FECA NIGERIA",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "Federation of Colleges Ex-Students Christian Association",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius if desired
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 3), // Offset the shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ), // shape the image edges
                    image: DecorationImage(
                      image: AssetImage("images/overview2.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.5,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "BELIEF",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "We are guided by beliefs which act as a compass to fulfilling our mandate",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius if desired
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 3), // Offset the shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ), // shape the image edges
                    image: DecorationImage(
                      image: AssetImage("images/overview3.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.5,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "CORE VALUES",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "Our mission and core values drive our culture and are the foundation of our practice",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius if desired
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 3), // Offset the shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ), // shape the image edges
                    image: DecorationImage(
                      image: AssetImage("images/overview4.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.5,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "ANTHEM",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "We shall rise and shine like the light...",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 130,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius:
                  BorderRadius.circular(10.0), // Add border radius if desired
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Shadow color
                  offset: const Offset(2, 3), // Offset the shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ), // shape the image edges
                    image: DecorationImage(
                      image: AssetImage("images/overview5.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceWidth * 0.5,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "HISTORY",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "We have a history which act as a reminder to fulfill our vision",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dailyPage() {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      clipBehavior: Clip.none,
      child: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.2), // Shadow color
                              offset: const Offset(
                                  2, 3), // Offset the shadow position
                            ),
                          ],
                        ),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: colorScheme.tertiary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _formattedDateTime,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Daily Inspiration",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: <Color>[
                              Colors.purple,
                              Colors.pink,
                              Colors.orange,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors
                              .white, // The color will be replaced by the gradient
                        ),
                      ),
                      const SizedBox(height: 10),
                      FaIcon(
                        FontAwesomeIcons.xTwitter,
                        color: colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Proverbs 12:22",
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Topic: ",
                    style: TextStyle(
                      color: colorScheme.tertiary,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AnimatedTextKit(
                    pause: const Duration(milliseconds: 500),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Integrity",
                        speed: const Duration(milliseconds: 150),
                        textStyle: TextStyle(
                          color: colorScheme.tertiary,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "It's a word that get's thrown around a lot, but what does integrity mean? \nDig into Proverbs 11:3 (the opposite of integrity is duplicity), Proverbs 12:22 (the role of honesty) and Hebrews 13:18 (having a clear conscience) with your small group. \nDiscuss what integrity looks like in school, at home, through activities and in relationships with others.",
                style: TextStyle(color: colorScheme.secondary, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventPage() {
    return const Center(child: Text("Events"));
  }
}
