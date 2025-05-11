import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Lesson')),
      body: Center(
        child: Lottie.asset(
          'assets/animations/sample_animation.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
