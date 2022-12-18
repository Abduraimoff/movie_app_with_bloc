// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movie_app/ui/pages/home_page/home_widgets/movie_list_widget.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../utils/export_pack.dart';
import 'detail_widgets/back_button_widget.dart';
import 'detail_widgets/cast_list_widget.dart';
import 'detail_widgets/pay_button_widget.dart';
import 'detail_widgets/rating_widget.dart';

class DetailPage extends StatefulWidget {
  final int movieId;

  const DetailPage({
    super.key,
    required this.movieId,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void didChangeDependencies() {
    context.read<MovieDetailBloc>().add(MovieDetailEvent(widget.movieId));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieDetailBloc>().state;
    final isLoading = state.isLoading;
    final error = state.errorMessage;
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.noenPrimaryColor,
                backgroundColor: AppColors.pinkColor,
                strokeWidth: 3,
              ),
            )
          : (error != null)
              ? Center(
                  child: Text(error),
                )
              : const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieDetailBloc>().state;
    final movie = state.movie;
    final similarMovies = state.similarMovies;

    final String _imageUrl =
        'https://image.tmdb.org/t/p/original/${movie?.backdropPath}';
    const String _notFoundImg =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQao8O6Q2B0vAVkVUAUKOBqrB7TJ9PiZCtdww&usqp=CAU';

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 450.h,
                width: double.infinity,
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: const Duration(milliseconds: 200),
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.network(
                    _notFoundImg,
                    fit: BoxFit.cover,
                  ),
                  placeholder: kTransparentImage,
                  image: _imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const BackButtonWidget(),
              PlayButtonWidget(movie?.trailerId),
            ],
          ),
          Center(
            child: SizedBox(
              width: 285.w,
              child: Column(
                children: [
                  _TitleWidget(title: movie?.title ?? ''),
                  _SubtitleWidget(text: movie?.tagline ?? ''),
                  RatingWidget(votes: double.parse(movie?.voteAverage ?? '0')),
                  _DescriptionWidget(movie?.overview ?? ''),
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
          CastListWidget(casts: movie?.castList ?? []),
          Padding(
            padding: EdgeInsets.only(left: 21.w, top: 15.h),
            child: Text(
              'Similar movies',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17.sp,
                color: Colors.white,
                height: 23.15 / 17.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          MoiveListWidget(movieList: similarMovies),
          SizedBox(height: 20.h),
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
  final String text;

  const _SubtitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
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
