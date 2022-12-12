// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/utils/config.dart';
import 'package:movie_app/utils/export_pack.dart';
import 'package:transparent_image/transparent_image.dart';

class CastCardWidget extends StatelessWidget {
  final Cast cast;

  const CastCardWidget({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    final String _imageUrl = '${Config.imageUrl}/${cast.profilePath}';

    return Container(
      height: 60.h,
      width: 60.w,
      margin: EdgeInsets.only(top: 14.h),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 2,
          color: Colors.white.withOpacity(0.15),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: _imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
