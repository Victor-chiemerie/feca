import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../components/page_transitions.dart';
import 'welcome_page2.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({super.key});

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.25,
                ),
                Container(
                  height: deviceHeight * 0.25,
                  width: deviceWidth * 0.55,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("images/logo.jpg"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                    color: colorScheme.tertiary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AnimatedTextKit(
                  pause: const Duration(milliseconds: 500),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "FECA NIGERIA APP",
                      speed: const Duration(milliseconds: 150),
                      textStyle: TextStyle(
                        color: colorScheme.tertiary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: false,
                  onFinished: () {
                    // Start the second animation after the first one is finished
                    setState(
                      () {
                        Navigator.pushReplacement(
                          context,
                          SizeTransition2(
                            const WelcomePage2(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "powered by",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "BobbyTech",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade300,
                    decoration: TextDecoration.underline,
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
