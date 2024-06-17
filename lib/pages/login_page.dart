import 'package:feca/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function() onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final _formField = GlobalKey<FormState>();
  bool _showPassword = true;

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Form(
        key: _formField,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.accessibility_new,
              size: 60,
              color: colorScheme.secondary,
            ),

            const SizedBox(height: 50),

            // welcome back message
            Text(
              "welcome back, you've been missed",
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.secondary,
              ),
            ),

            const SizedBox(height: 25),

            // email text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.tertiary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.secondary,
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: colorScheme.secondary,
                  ),
                ),
                controller: _emailController,
              ),
            ),

            const SizedBox(height: 10),

            // password text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
                controller: _pwController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.tertiary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorScheme.secondary,
                    ),
                  ),
                  hintText: 'password',
                  hintStyle: TextStyle(
                    color: colorScheme.secondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // login button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.tertiary),
              // TODO set condition to validate form
              onPressed: () => login(context),
              child: Text(
                "Login",
                style: TextStyle(
                  color: colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: colorScheme.primary,
                  ),
                ),
                TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.tertiary,
                    ),
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
