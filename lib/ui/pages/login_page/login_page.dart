// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';

import '../../../utils/export_pack.dart';
import 'login_widgets/login_avatar_widget.dart';
import 'login_widgets/login_button_widget.dart';
import 'login_widgets/login_info_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _avatarController;
  late Animation<double> _opacity;

  @override
  void initState() {
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(parent: _avatarController, curve: Curves.easeInOut),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _avatarController.forward();
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: _screenHeight,
        width: _screenWidth,
        child: Stack(
          children: [
            _BackFilterWidget(
              top: 80.h,
              left: 16.w,
              color: AppColors.pinkColor,
            ),
            _BackFilterWidget(
              top: 264.h,
              left: 300.w,
              color: AppColors.noenPrimaryColor,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 63.h),
                    AnimatedBuilder(
                      animation: _avatarController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _opacity.value,
                          child: const LoginAvatarWidget(),
                        );
                      },
                    ),
                    const LoginInfoWidget(),
                    AnimatedBuilder(
                      animation: _avatarController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _opacity.value,
                          child: const LoginButtonWidget(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackFilterWidget extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Color color;

  const _BackFilterWidget({
    Key? key,
    this.top,
    // ignore: unused_element
    this.left,
    // ignore: unused_element
    this.right,
    // ignore: unused_element
    this.bottom,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: 165.w,
        height: 165.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
          child: Container(
            width: 165.w,
            height: 165.h,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
