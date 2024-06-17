import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _conPwController = TextEditingController();
  final _formField = GlobalKey<FormState>();
  bool _showPassword = true;
  bool _showConPassword = true;

  // reister page
  void register() {
    // register user
    print("This user has registered");
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

            // welcome message
            Text(
              "Let's create an account for you",
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

            // pasword text field
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

            const SizedBox(height: 10),

            // confirm password text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Confirm Password";
                  }
                  return null;
                },
                controller: _conPwController,
                obscureText: _showConPassword,
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
                  hintText: 'confirm password',
                  hintStyle: TextStyle(
                    color: colorScheme.secondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showConPassword = !_showConPassword;
                      });
                    },
                    icon: Icon(
                      _showConPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // register button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.tertiary,
              ),
              onPressed: register,
              child: Text(
                "Register",
                style: TextStyle(
                  color: colorScheme.surface,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    "Login now",
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
