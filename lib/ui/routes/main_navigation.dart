import 'package:flutter/cupertino.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';
import 'package:movie_app/utils/export_pack.dart';

abstract class MainNavigationRouteNames {
  static const String intro = 'intro';
  static const String login = 'login';
  static const String nav = '/';
  static const String home = '/home';
  static const String detail = '/home/detail';
}

class MainNavigation {
  static String initialRoute(bool isAuth) =>
      isAuth 
      ? MainNavigationRouteNames.nav 
      : MainNavigationRouteNames.intro;

  static final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.intro: (context) => ScreenFactory.makeIntroPage(),
    MainNavigationRouteNames.login: (context) => ScreenFactory.makeLoginPage(),
    MainNavigationRouteNames.nav: (context) => ScreenFactory.makeNavPage(),
    MainNavigationRouteNames.home: (context) => ScreenFactory.makeHomePage(),
    MainNavigationRouteNames.detail: (context) =>
        ScreenFactory.makeDetailPage(),
  };

  // Route<Object> onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case MainNavigationRouteNames.home:
  //       final arguments = settings.arguments as int;
  //       return MaterialPageRoute(builder: builder);
  //       break;
  //     default:
  //   }
  // }
}
