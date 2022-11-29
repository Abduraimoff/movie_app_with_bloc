import 'package:movie_app/utils/export_pack.dart';

class LoginAvatarWidget extends StatelessWidget {
  const LoginAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 338.w,
        height: 338.h,
        padding: EdgeInsets.symmetric(
          horizontal: 5.h,
          vertical: 5.w,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.pinkColor.withOpacity(0.6),
              AppColors.pinkColor.withOpacity(0.1),
              AppColors.noenPrimaryColor.withOpacity(0.1),
              AppColors.noenPrimaryColor
            ],
            stops: const [0.2, 0.4, 0.6, 1],
          ),
        ),
        child: const DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              alignment: Alignment.bottomLeft,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login_avatar.png'),
            ),
          ),
        ),
      ),
    );
  }
}
