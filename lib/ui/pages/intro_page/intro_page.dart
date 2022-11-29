// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/ui/widgets/back_filter_widget.dart';
import '../../../utils/export_pack.dart';
import 'intro_widgets/login_intro_widget.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: _screenHeight,
        width: _screenWidth,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            BackFilterWidget(
              top: 80.h,
              left: 16.w,
              color: AppColors.pinkColor,
            ),
            BackFilterWidget(
              top: 264.h,
              left: 300.w,
              color: AppColors.noenPrimaryColor,
            ),
            const LoginIntroPage(),
          ],
        ),
      ),
    );
  }
}
