import 'package:flutter/cupertino.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const String intro = 'intro';
  static const String login = 'login';
  static const String nav = 'nav';
  static const String home = 'home';
  static const String detail = 'home/detail';
}

class MainNavigation {
  static const initialRoute = MainNavigationRouteNames.intro;
  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.intro: (context) => ScreenFactory.makeIntroPage(),
    MainNavigationRouteNames.login: (context) => ScreenFactory.makeLoginPage(),
    MainNavigationRouteNames.nav: (context) => ScreenFactory.makeNavPage(),
    MainNavigationRouteNames.home: (context) => ScreenFactory.makeHomePage(),
    MainNavigationRouteNames.detail: (context) =>
        ScreenFactory.makeDetailPage(),
  };
}
