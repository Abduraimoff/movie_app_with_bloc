// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_app/ui/pages/intro_page/intro_widgets/intro_button_widget.dart';
import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/ui/widgets/custom_text_field.dart';
import 'package:movie_app/utils/export_pack.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  String? _errorMessage;

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
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              _isLoading = (state is AuthLoading);

              if (state is AuthSucces) {
                _navigateToNavPage(context);
              }

              if (state is AuthError) {
                _errorMessage = state.errorMessage;
                if (_errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_errorMessage!),
                    ),
                  );
                }
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30.h),
                      Text('Username', style: titleStyle),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        controller: _userController,
                        hintText: 'Enter username',
                      ),
                      SizedBox(height: 25.h),
                      Text('Password', style: titleStyle),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Enter password',
                      ),
                      SizedBox(height: 50.h),
                      Center(
                        child: LoginButtonWidget(
                          onTap: _onLoginTap,
                          isLoading: _isLoading,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onLoginTap() {
    final bloc = context.read<AuthBloc>();
    final _username = _userController.text;
    final _password = _passwordController.text;

    if (_username.isNotEmpty && _password.isNotEmpty) {
      bloc.add(
        AuthEvent(username: _username, password: _password),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter username and password!!!'),
        ),
      );
    }
  }
}

_navigateToNavPage(BuildContext context) {
  Navigator.pushReplacementNamed(
    context,
    RouteNames.nav,
  );
}
