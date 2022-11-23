import 'package:flutter/cupertino.dart';
import 'package:movie_app/ui/pages/home_page/home_page.dart';
import 'package:movie_app/ui/pages/login_page/login_page.dart';

abstract class MainNavigationRouteNames {
  static const String login = 'login';
  static const String home = 'home';
}

class MainNavigation {
  static const initialRoute = MainNavigationRouteNames.login;
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.login: (context) => const LoginPage(),
    MainNavigationRouteNames.home: (context) => const HomePage(),
  };
}
