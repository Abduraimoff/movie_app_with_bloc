// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/models/cast.dart';
import 'package:movie_app/utils/export_pack.dart';

import 'cast_widgets/cast_avatar_widget.dart';

class CastPage extends StatelessWidget {
  final Cast cast;

  const CastPage({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    final String _imageUrl =
        'https://image.tmdb.org/t/p/original/${cast.profilePath}';
    const String _notFoundImg =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQao8O6Q2B0vAVkVUAUKOBqrB7TJ9PiZCtdww&usqp=CAU';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CastAvatarWidget(
              notFoundImg: _notFoundImg,
              imageUrl: _imageUrl,
            ),
            SizedBox(height: 20.h),
            CastName(name: cast.name),
            Padding(
              padding: EdgeInsets.only(left: 21.w, top: 20.h, bottom: 20.h),
              child: Text(
                'Personal Info',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19.sp,
                  color: Colors.white,
                  height: 23.15 / 19.sp,
                ),
              ),
            ),
            const CastTitle('Known for:'),
            CastSubtitle(cast.knownForDepartment),
            const CastTitle('Gender:'),
            CastSubtitle(cast.gender == 1 ? 'Female' : 'Male'),
            const CastTitle('Character:'),
            CastSubtitle(cast.character),
            const CastTitle('Popularity:'),
            CastSubtitle(cast.popularity.toString()),
          ],
        ),
      ),
    );
  }
}

class CastTitle extends StatelessWidget {
  final String text;
  const CastTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, top: 10.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class CastSubtitle extends StatelessWidget {
  final String text;
  const CastSubtitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w, top: 5.h, bottom: 20.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class CastName extends StatelessWidget {
  const CastName({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
