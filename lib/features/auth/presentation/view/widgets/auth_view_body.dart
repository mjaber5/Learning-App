import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.language, size: 80, color: MColors.secondary),
            const SizedBox(height: 16),
            Text(
              isLogin ? 'Welcome Back 👋' : 'Create Account 🚀',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: MColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isLogin
                  ? 'Login to continue your journey'
                  : 'Sign up and start learning today',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: MColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Auth Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: MColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: MColors.grey.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: MColors.lightContainer,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: MColors.lightContainer,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: MColors.secondary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).pushReplacement(AppRouter.kLayoutView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MColors.buttonPrimary,
                      foregroundColor: MColors.textWhite,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      isLogin ? 'Login' : 'Register',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => setState(() => isLogin = !isLogin),
                    child: Text(
                      isLogin
                          ? "Don't have an account? Register"
                          : "Already have an account? Login",
                      style: const TextStyle(
                        color: MColors.buttonPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata, size: 28),
                    label: const Text('Continue with Google'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: MColors.textPrimary,
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(color: MColors.borderPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
