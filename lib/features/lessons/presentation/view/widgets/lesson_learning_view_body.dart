import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class LessonLearningViewBody extends StatelessWidget {
  const LessonLearningViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Choose Your Lesson Type",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 30),
          _buildLessonCard(
            context,
            icon: Icons.play_circle_fill,
            title: "Video Lessons",
            description: "Watch interactive lessons with high quality videos.",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kVideoLessonsView);
            },
            color: MColors.buttonPrimary,
          ),
          const SizedBox(height: 20),
          _buildLessonCard(
            context,
            icon: Icons.audiotrack,
            title: "Audio Lessons",
            description: "Listen and learn anywhere with audio content.",
            onTap: () {
              GoRouter.of(context).push(AppRouter.kAudioLessonsView);
            },
            color: MColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 40),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
