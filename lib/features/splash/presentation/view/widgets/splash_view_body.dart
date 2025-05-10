import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(AppRouter.kAuthView); // Or login
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: ScaleTransition(
          scale: _animation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 200),
                // Use this if you want to show a Lottie animation
                Lottie.asset(
                  'assets/images/splash_language.json',
                  fit: BoxFit.contain,
                  width: 500,
                  height: 500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
