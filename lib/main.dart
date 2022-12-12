import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/data/models/my_app_model.dart';
import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/ui/theme/app_theme.dart';
import 'package:movie_app/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.bgColor, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarBrightness: Brightness.dark, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
      systemNavigationBarDividerColor:
          Colors.transparent, //Navigation bar divider
    ),
  );
  final app = MyApp(model: model);
  runApp(app);
}

class MyApp extends StatelessWidget {
  final MyAppModel model;
  const MyApp({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          theme: AppTheme.theme,
          routes: MainNavigation.routes,
          initialRoute: MainNavigation.initialRoute(model.isAuth),
          onGenerateRoute: MainNavigation.onGenerateRoute,
          title: 'Movie App',
        );
      },
    );
  }
}
