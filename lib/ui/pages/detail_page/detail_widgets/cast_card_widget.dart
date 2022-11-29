import 'package:movie_app/utils/export_pack.dart';

class CastCardWidget extends StatelessWidget {
  const CastCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      margin: EdgeInsets.only(top: 14.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: Colors.white.withOpacity(0.15),
        ),
        image: const DecorationImage(
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w138_and_h175_face/cgoy7t5Ve075naBPcewZrc08qGw.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
