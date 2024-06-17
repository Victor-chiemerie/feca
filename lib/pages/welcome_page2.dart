import 'package:feca/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';

import '../services/auth/login_or_register.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({super.key});

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {
  bool _isNextPage = false;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    const activeColor = Color.fromARGB(255, 24, 88, 27),
        inactiveColor = Color.fromARGB(255, 87, 180, 91);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthGate(),
                        ),
                      );
                    },
                    iconAlignment: IconAlignment.end,
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: colorScheme.tertiary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // TODO (enable change in picture when next and back button are clicked)
                  Container(
                    height: deviceHeight * 0.4,
                    width: deviceWidth * 0.4,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/man.jpg"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isNextPage
                        ? "Make yourself at home"
                        : "Keep the Vision Burning!",
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _isNextPage
                        ? "FECA APP will automatically switch to dark mode accordingly with system setting"
                        : "The Goal has always been to keep the vision burning and alive. Where there is no vision, we run headless",
                    style: TextStyle(
                      color: colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: _isNextPage ? inactiveColor : activeColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: _isNextPage ? activeColor : inactiveColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: _isNextPage
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (_isNextPage)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isNextPage = false;
                            });
                          },
                          child: Text(
                            "BACK",
                            style: TextStyle(
                              color: colorScheme.tertiary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      TextButton(
                        onPressed: () {
                          if (_isNextPage) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AuthGate(),
                              ),
                            );
                          }
                          setState(() {
                            _isNextPage = true;
                          });
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            color: colorScheme.tertiary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
