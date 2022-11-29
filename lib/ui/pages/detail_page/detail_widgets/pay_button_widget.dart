import 'package:movie_app/utils/export_pack.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.h,
      right: 21.w,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 60.w,
          height: 60.h,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
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
              borderRadius: BorderRadius.circular(30.r),
              backgroundBlendMode: BlendMode.srcOver,
              color: AppColors.bgColor.withOpacity(1),
              boxShadow: [
                const BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  color: AppColors.noenPrimaryColor,
                ),
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}
