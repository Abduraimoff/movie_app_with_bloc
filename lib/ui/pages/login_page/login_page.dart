// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/ui/pages/intro_page/intro_widgets/intro_button_widget.dart';
import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/ui/widgets/custom_text_field.dart';
import 'package:movie_app/utils/export_pack.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    final titleStyle = TextStyle(
      fontSize: 17.sp,
      color: Colors.white.withOpacity(0.7),
      fontWeight: FontWeight.w400,
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          height: _screenHeight,
          width: _screenWidth,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text('Username', style: titleStyle),
                  SizedBox(height: 10.h),
                  const CustomTextField(
                    hintText: 'Enter username',
                  ),
                  SizedBox(height: 25.h),
                  Text('Password', style: titleStyle),
                  SizedBox(height: 10.h),
                  const CustomTextField(
                    hintText: 'Enter password',
                  ),
                  SizedBox(height: 50.h),
                  Center(
                    child: LoginButtonWidget(
                      onTap: () => _navigateToNavPage(context),
                      // isLoading: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_navigateToNavPage(BuildContext context) {
  Navigator.pushReplacementNamed(
    context,
    MainNavigationRouteNames.nav,
  );
}
