// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/casts_bloc/casts_bloc.dart';
import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/utils/config.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../utils/export_pack.dart';
import 'detail_widgets/back_button_widget.dart';
import 'detail_widgets/cast_list_widget.dart';
import 'detail_widgets/pay_button_widget.dart';
import 'detail_widgets/rating_widget.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final id = movie.id;
    return Scaffold(
      body: BlocProvider(
        create: (context) => CastsBloc()..add(CastsLoadEvent(id)),
        child: _Body(movie: movie),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final String _imageUrl = '${Config.imageUrl}/${movie.posterPath}';

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 450.h,
                width: double.infinity,
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: const Duration(milliseconds: 200),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                  placeholder: kTransparentImage,
                  image: _imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const BackButtonWidget(),
              const PlayButtonWidget(),
            ],
          ),
          Center(
            child: SizedBox(
              width: 285.w,
              child: Column(
                children: [
                  _TitleWidget(title: movie.title),
                  _SubtitleWidget(
                    date: movie.releaseDate,
                    lan: movie.originalLanguage,
                  ),
                  RatingWidget(votes: double.parse(movie.voteAverage)),
                  _DescriptionWidget(movie.overview),
                ],
              ),
            ),
          ),
          const _DividerWidget(),
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 12.h),
            child: Text(
              'Casts',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17.sp,
                color: Colors.white,
                height: 23.15 / 17.sp,
              ),
            ),
          ),
          const CastListWidget(),
        ],
      ),
    );
  }
}

class _DividerWidget extends StatelessWidget {
  const _DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Divider(
        color: Colors.white.withOpacity(0.15),
        thickness: 2,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final String text;

  const _DescriptionWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          text,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
            color: Colors.white,
            height: 23.15 / 15.sp,
          ),
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17.sp,
            color: Colors.white,
            height: 22 / 17.sp,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _SubtitleWidget extends StatelessWidget {
  final String date;
  final String lan;

  const _SubtitleWidget({
    Key? key,
    required this.date,
    required this.lan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$date  ($lan)',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
            color: Colors.white,
            height: 22 / 17.sp,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
