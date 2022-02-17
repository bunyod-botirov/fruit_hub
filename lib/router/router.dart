import 'package:flutter/material.dart';
import 'package:fruit_hub/screens/home_page.dart';
import 'package:fruit_hub/screens/order_complete_page.dart';
import 'package:fruit_hub/screens/order_page.dart';
import 'package:fruit_hub/screens/product_page.dart';
import 'package:fruit_hub/screens/splash_page.dart';
import 'package:fruit_hub/screens/track_order_page.dart';
import 'package:fruit_hub/screens/welcome_page.dart';
import 'package:fruit_hub/screens/authentication_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/splash":
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case "/welcome":
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        );
      case "/authentication":
        return MaterialPageRoute(
          builder: (context) => AuthenticationPage(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case "/product":
        return MaterialPageRoute(
          builder: (context) => ProductPage(
            product: args as Map<String, dynamic>,
          ),
        );
      case "/order":
        return MaterialPageRoute(
          builder: (context) => const OrderPage(),
        );
      case "/order_complete":
        return MaterialPageRoute(
          builder: (context) => const OrderCompletePage(),
        );

      case "/track_order":
        return MaterialPageRoute(
          builder: (context) => TrackOrderPage(),
        );
    }
  }
}
