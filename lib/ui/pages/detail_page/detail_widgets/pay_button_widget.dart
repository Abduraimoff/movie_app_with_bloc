import 'package:movie_app/utils/export_pack.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PlayButtonWidget extends StatelessWidget {
  final String? youtubeId;
  const PlayButtonWidget(this.youtubeId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(30.r),
              onTap: () async {
                final youtubeUrl = 'https://www.youtube.com/embed/$youtubeId';
                if (await canLaunchUrl(Uri.parse(youtubeUrl))) {
                  await launchUrlString(youtubeUrl);
                }
              },
              child: Ink(),
            ),
          ),
        ),
      ],
    );
  }
}
