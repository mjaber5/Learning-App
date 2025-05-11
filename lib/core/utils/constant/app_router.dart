import 'package:go_router/go_router.dart';
import 'package:learning_app/features/auth/presentation/view/auth_view.dart';
import 'package:learning_app/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:learning_app/features/layout/presentation/view/layout_view.dart';
import 'package:learning_app/features/lessons/presentation/view/audio_pronunciation_view.dart';
import 'package:learning_app/features/lessons/presentation/view/lesson_learning_view.dart';
import 'package:learning_app/features/lessons/presentation/view/lessons_view.dart';
import 'package:learning_app/features/lessons/presentation/view/video_lesson_view.dart';
import 'package:learning_app/features/profile/presentation/view/profile_view.dart';
import 'package:learning_app/features/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kAuthView = '/authView';
  static const String kDashboardView = '/dashboardView';
  static const String kLayoutView = '/layoutView';
  static const String kLessonsView = '/lessonsView';
  static const String kProfileView = '/profileView';
  static const String kLessonLearningView = '/lessonLearningView';
  static const String kVideoLessonsView = '/videoLessonsView';
  static const String kAudioLessonsView = '/audioLessonsView';

  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kAuthView, builder: (context, state) => const AuthView()),
      GoRoute(
        path: kDashboardView,
        builder: (context, state) => DashboardView(),
      ),
      GoRoute(path: kLayoutView, builder: (context, state) => LayoutView()),
      GoRoute(path: kLessonsView, builder: (context, state) => LessonsView()),
      GoRoute(path: kProfileView, builder: (context, state) => ProfileView()),
      GoRoute(
        path: kLessonLearningView,
        builder: (context, state) => LessonLearningView(),
      ),
      GoRoute(
        path: kVideoLessonsView,
        builder: (context, state) => VideoLessonsView(),
      ),
      GoRoute(
        path: kAudioLessonsView,
        builder: (context, state) => AudioLessonsView(),
      ),
    ],
  );
}
