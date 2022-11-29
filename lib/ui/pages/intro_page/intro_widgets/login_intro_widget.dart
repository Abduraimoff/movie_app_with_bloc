import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/utils/export_pack.dart';

import 'intro_avatar_widget.dart';
import 'intro_button_widget.dart';
import 'intro_info_widget.dart';

class LoginIntroPage extends StatelessWidget {
  const LoginIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 63.h),
          const LoginAvatarWidget(),
          const LoginInfoWidget(),
          LoginButtonWidget(onTap: () => _navigateToLogin(context)),
        ],
      ),
    );
  }
}

_navigateToLogin(BuildContext context) {
  Navigator.pushReplacementNamed(
    context,
    MainNavigationRouteNames.login,
  );
}
