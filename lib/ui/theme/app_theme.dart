import 'package:movie_app/utils/export_pack.dart';

class AppTheme {
  static final theme = ThemeData(
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.bgColor,
    
  );
}
