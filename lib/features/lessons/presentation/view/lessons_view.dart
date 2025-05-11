import 'package:flutter/material.dart';
import 'package:learning_app/features/lessons/presentation/view/widgets/lessons_view_body.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LessonsViewBody());
  }
}
