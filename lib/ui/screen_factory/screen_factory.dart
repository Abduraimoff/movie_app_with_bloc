import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:movie_app/bloc/navigation_cubit/navigation_cubit.dart';
import 'package:movie_app/ui/pages/home_page/home_page.dart';
import 'package:movie_app/ui/pages/intro_page/intro_page.dart';
import 'package:movie_app/ui/pages/login_page/login_page.dart';
import 'package:movie_app/ui/pages/nav_page/nav_page.dart';
import 'package:movie_app/ui/pages/person_page/person_page.dart';
import 'package:movie_app/utils/export_pack.dart';

class ScreenFactory {
  static Widget makeIntroPage() => const IntroPage();

  static Widget makeLoginPage() => BlocProvider(
        create: (context) => AuthBloc(),
        child: const LoginPage(),
      );

  static Widget makeNavPage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: const NavPage(),
    );
  }

  static Widget makeHomePage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (context) => MoviesBloc()
            ..add(
              const MoviesLoad(),
            ),
        ),
      ],
      child: const HomePage(),
    );
  }
}
