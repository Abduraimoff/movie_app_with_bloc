// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/ui/routes/main_navigation.dart';
import 'package:movie_app/utils/config.dart';
import 'package:movie_app/utils/export_pack.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
      bottomLeft: Radius.circular(20.r),
      bottomRight: Radius.circular(55.r),
    );
    const String _notFoundImg =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQao8O6Q2B0vAVkVUAUKOBqrB7TJ9PiZCtdww&usqp=CAU';

    return SizedBox(
      width: 147.w,
      height: 160.h,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 147.w,
            height: 200.h,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(milliseconds: 200),
                placeholder: kTransparentImage,
                imageErrorBuilder: (context, error, stackTrace) =>
                    Image.network(
                  _notFoundImg,
                  fit: BoxFit.cover,
                ),
                image: '${Config.imageUrl}/${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 147.w,
            height: 200.h,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: Material(
              color: Colors.transparent,
              borderRadius: borderRadius,
              child: InkWell(
                borderRadius: borderRadius,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RouteNames.detail,
                    arguments: movie.id,
                  );
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
