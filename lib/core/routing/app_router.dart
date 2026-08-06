import 'package:bookia/core/routing/routes.dart';
import 'package:bookia/features/athu/presentation/pages/login_screen.dart';
import 'package:bookia/features/athu/presentation/pages/register_screen.dart';
import 'package:bookia/features/athu/presentation/pages/welcome_screen.dart';
import 'package:bookia/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreenRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case Routes.registerScreenRoute:
        return MaterialPageRoute(builder: (context) => RegisterScreen());

      case Routes.welcomeScreenRoute:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());

      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      default:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
    }
  }
}
