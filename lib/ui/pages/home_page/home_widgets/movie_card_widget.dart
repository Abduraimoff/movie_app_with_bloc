import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/utils/export_pack.dart';

class MovieCardWidget extends StatelessWidget {
  final String? imageUrl;

  const MovieCardWidget({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
      bottomLeft: Radius.circular(20.r),
      bottomRight: Radius.circular(55.r),
    );
    return SizedBox(
      width: 147.w,
      height: 160.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: 147.w,
            height: 160.h,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.lightGreen[300],
              borderRadius: borderRadius,
              image: const DecorationImage(
                image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 147.w,
            height: 160.h,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: Material(
              color: Colors.transparent,
              borderRadius: borderRadius,
              child: InkWell(
                borderRadius: borderRadius,
                onTap: () {
                  Navigator.pushNamed(context, MainNavigationRouteNames.detail);
                },
                child: Ink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
