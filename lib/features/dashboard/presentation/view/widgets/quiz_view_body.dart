import 'package:flutter/material.dart';
import 'package:learning_app/core/utils/constant/colors.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _isQuizFinished = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What does "Bonjour" mean in English?',
      'options': ['Goodbye', 'Thank you', 'Hello', 'Please'],
      'answer': 'Hello',
    },
    {
      'question': 'What is the Spanish word for "Apple"?',
      'options': ['Manzana', 'Banana', 'Pera', 'Naranja'],
      'answer': 'Manzana',
    },
    {
      'question': 'How do you say "Thank you" in German?',
      'options': ['Bitte', 'Danke', 'Hallo', 'Tschüss'],
      'answer': 'Danke',
    },
  ];

  void _selectAnswer(String selected) {
    if (selected == _questions[_currentQuestion]['answer']) {
      _score++;
    }
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
      });
    } else {
      setState(() {
        _isQuizFinished = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _isQuizFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child:
          _isQuizFinished
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events, size: 100, color: Colors.amber),
                    SizedBox(height: 20),
                    Text(
                      'Quiz Completed!',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your Score: $_score / ${_questions.length}',
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        backgroundColor: MColors.secondary,
                      ),
                      child: Text(
                        'Try Again',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: MColors.primaryBackground,
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: (_currentQuestion + 1) / _questions.length,
                      backgroundColor: Colors.grey[200],
                      color: MColors.secondary,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Question ${_currentQuestion + 1} of ${_questions.length}',
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(height: 10),
                    Text(
                      _questions[_currentQuestion]['question'],
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    ...(_questions[_currentQuestion]['options'] as List<String>)
                        .map(
                          (option) => GestureDetector(
                            onTap: () => _selectAnswer(option),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(vertical: 8),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(color: MColors.secondary),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                option,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
    );
  }
}
