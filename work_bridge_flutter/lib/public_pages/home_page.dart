import 'package:flutter/material.dart';
import 'package:work_bridge_flutter/themes/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(color: AppTheme.primary, height: 30, width: 30)),
    );
  }
}
