import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/core/utils/constant/app_router.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: MColors.primaryBackground,
        elevation: 0,
        title: Text(
          'Hello, Mohammed 👋',
          style: TextStyle(
            color: MColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: MColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Progress Overview
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProgressCard(
                  'Streak',
                  '5 Days',
                  Icons.local_fire_department,
                  Colors.orange,
                ),
                _buildProgressCard('Words', '120', Icons.book, Colors.blue),
                _buildProgressCard('Goal', '80%', Icons.flag, Colors.green),
              ],
            ),
            SizedBox(height: 20),
            // Quick Access Cards
            _buildLessonCard(
              'Continue Lesson',
              'Basics of Spanish',
              Icons.play_arrow,
              MColors.secondary,
              () {
                GoRouter.of(context).push(AppRouter.kLessonLearningView);
              },
            ),
            SizedBox(height: 10),
            _buildLessonCard(
              'New Challenge',
              'Grammar Quiz',
              Icons.quiz,
              MColors.buttonSecondary,
              () {
                GoRouter.of(context).push(AppRouter.kQuizView);
              },
            ),
            SizedBox(height: 20),
            // Motivational Quote
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: MColors.lightContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
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
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MColors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: MColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: MColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    GestureTapCallback? onTap,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MColors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: MColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: MColors.textSecondary),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: MColors.textSecondary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
