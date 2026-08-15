import 'package:flutter/material.dart';
import 'package:work_bridge_flutter/auth/screen/login_screen.dart';
import 'package:work_bridge_flutter/public_pages/home_page.dart';

class AppRouter {
  static const String root = '/';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
      // This is where your RoleRedirectScreen or Home would go
        return MaterialPageRoute(builder: (_) => const HomePage());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    // Add cases for /register and /forgot-password here
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}