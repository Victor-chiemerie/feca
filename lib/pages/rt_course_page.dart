import 'package:flutter/material.dart';

class RtCoursePage extends StatelessWidget {
  const RtCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(),
    );
  }
}
