import '../../../../utils/export_pack.dart';

class LoginInfoWidget extends StatelessWidget {
  const LoginInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 21.h),
        Text(
          'Watch movies in Virtual Reality',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white.withOpacity(0.85),
            fontSize: 34.sp,
          ),
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 276.w,
          child: Text(
            'Download and watch offline wherever you are',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.7),
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
