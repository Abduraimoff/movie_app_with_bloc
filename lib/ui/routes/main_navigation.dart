import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/ui/pages/detail_page/detail_page.dart';
import 'package:movie_app/ui/screen_factory/screen_factory.dart';
import 'package:movie_app/utils/export_pack.dart';

abstract class RouteNames {
  static const String intro = 'intro';
  static const String login = 'login';
  static const String nav = '/';
  static const String home = '/home';
  static const String detail = '/detail';
}

class MainNavigation {
  static String initialRoute(bool isAuth) =>
      isAuth ? RouteNames.nav : RouteNames.intro;

  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.intro: (context) => ScreenFactory.makeIntroPage(),
    RouteNames.login: (context) => ScreenFactory.makeLoginPage(),
    RouteNames.nav: (context) => ScreenFactory.makeNavPage(),
    RouteNames.home: (context) => ScreenFactory.makeHomePage(),
  };

  static Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.detail:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (context) => DetailPage(movie: movie),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Text('data'),
        );
    }
  }
}
