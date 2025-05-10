import 'package:go_router/go_router.dart';
import 'package:learning_app/features/auth/presentation/view/auth_view.dart';
import 'package:learning_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kAuthView = '/authView';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/authView', builder: (context, state) => const AuthView()),
    ],
  );
}
