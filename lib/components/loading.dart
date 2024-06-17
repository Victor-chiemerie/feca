import 'package:flutter/material.dart';

class Loading {
  void circular(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing while loading
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void stop(BuildContext context) {
    Navigator.pop(context); // Dismiss the loading dialog
  }

}