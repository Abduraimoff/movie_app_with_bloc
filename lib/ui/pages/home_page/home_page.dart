// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/playing_movies_bloc/playing_movies_bloc.dart';
import 'package:movie_app/ui/pages/home_page/home_widgets/movie_list_widget.dart';

import '../../../utils/export_pack.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: Container(
        height: _screenHeight,
        width: _screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer<PlayingMoviesBloc, PlayingMoviesState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is PlayingMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.noenPrimaryColor,
                  backgroundColor: AppColors.pinkColor,
                  strokeWidth: 3,
                ),
              );
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 55.h),
                    _buildMainTitle(),
                    SizedBox(height: 35.h),
                    _buildTitle('New movies'),
                    SizedBox(height: 18.h),
                    const MoiveListWidget(),
                    SizedBox(height: 23.h),
                    _buildTitle('Upcoming movies'),
                    SizedBox(height: 18.h),
                    const MoiveListWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _buildMainTitle() {
  return Center(
    child: SizedBox(
      width: 260.w,
      child: Text(
        'What would you like to watch?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28.sp,
          height: 38.sp / 28.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white.withOpacity(0.85),
        ),
      ),
    ),
  );
}

Widget _buildTitle(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 27.w),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 17.sp,
        height: 23.15.sp / 17.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white.withOpacity(0.75),
      ),
    ),
  );
}
