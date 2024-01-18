import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.greenAccent,
      )),
      backgroundColor: Colors.limeAccent,
    );
  }
}
