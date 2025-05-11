import 'package:flutter/material.dart';
import 'package:learning_app/features/dashboard/presentation/view/widgets/dashboard_View_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DashboardViewBody());
  }
}
