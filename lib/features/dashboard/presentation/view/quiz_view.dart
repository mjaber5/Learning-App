import 'package:flutter/material.dart';
import 'package:learning_app/features/dashboard/presentation/view/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuizViewBody());
  }
}
