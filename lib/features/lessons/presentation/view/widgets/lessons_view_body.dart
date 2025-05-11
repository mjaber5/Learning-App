import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class LessonsViewBody extends StatelessWidget {
  const LessonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final progressData = [
      {
        'title': 'Streak',
        'value': '5 Days',
        'icon': Icons.local_fire_department,
        'color': Colors.orange,
      },
      {
        'title': 'Words',
        'value': '120',
        'icon': Icons.book,
        'color': Colors.blue,
      },
      {
        'title': 'Goal',
        'value': '80%',
        'icon': Icons.flag,
        'color': Colors.green,
      },
    ];

    final lessonData = [
      {'title': 'Basics of Spanish', 'subtitle': 'Lesson 1', 'progress': 0.5},
      {
        'title': 'Intermediate Spanish',
        'subtitle': 'Lesson 2',
        'progress': 0.2,
      },
      {'title': 'Advanced Spanish', 'subtitle': 'Lesson 3', 'progress': 0.0},
    ];

    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: MColors.primaryBackground,
        elevation: 0,
        title: const Text(
          'Hello, Mohammed 👋',
          style: TextStyle(
            color: MColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: MColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  progressData.map((data) {
                    return _buildProgressCard(
                      data['title'] as String,
                      data['value'] as String,
                      data['icon'] as IconData,
                      data['color'] as Color,
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children:
                    lessonData.map((data) {
                      return _buildLessonCard(
                        context,
                        data['title'] as String,
                        data['subtitle'] as String,
                        data['progress'] as double,
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MColors.lightContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.format_quote, color: MColors.secondary),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '"Learning a new language is like becoming another person."',
                      style: TextStyle(color: MColors.textSecondary),
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

  Widget _buildProgressCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MColors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: MColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            title,
            style: const TextStyle(color: MColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(
    BuildContext context,
    String title,
    String subtitle,
    double progress,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MColors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: MColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: MColors.textSecondary, fontSize: 14),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: MColors.grey,
            color: MColors.secondary,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLessonLearningView);
            },
            child: const Text('Continue Lesson'),
          ),
        ],
      ),
    );
  }
}
