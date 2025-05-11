import 'package:flutter/material.dart';
import 'package:learning_app/core/utils/constant/colors.dart';
import 'package:learning_app/features/dashboard/presentation/view/dashboard_view.dart';
import 'package:learning_app/features/lessons/presentation/view/lessons_view.dart';
import 'package:learning_app/features/profile/presentation/view/profile_view.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  var _currentIndex = 0;
  List screens = const [DashboardView(), LessonsView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.transparent,
        items: [
          // Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: MColors.secondary,
          ),

          /// News
          SalomonBottomBarItem(
            icon: const Icon(Icons.book),
            title: const Text('Lessons'),
            selectedColor: MColors.secondary,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            selectedColor: MColors.secondary,
          ),
        ],
        onTap:
            (index) => setState(() {
              _currentIndex = index;
            }),
        // currentIndex: _currentIndex,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        //  backgroundColor: Colors.blue,
      ),
    );
  }
}
