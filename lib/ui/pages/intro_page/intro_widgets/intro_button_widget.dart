import '../../../../utils/export_pack.dart';

class LoginButtonWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;

  const LoginButtonWidget({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: 160.w,
        height: 38.h,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.pinkColor,
              AppColors.noenPrimaryColor,
            ],
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            backgroundBlendMode: BlendMode.hardLight,
            color: AppColors.bgColor.withOpacity(1),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 10.w,
                    height: 10.h,
                    child: const CircularProgressIndicator(
                      color: AppColors.noenPrimaryColor,
                      backgroundColor: AppColors.pinkColor,
                      strokeWidth: 3,
                    ),
                  )
                : Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
