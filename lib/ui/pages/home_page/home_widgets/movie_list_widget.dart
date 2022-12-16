import 'package:movie_app/ui/pages/home_page/home_widgets/movie_card_widget.dart';
import 'package:movie_app/utils/export_pack.dart';

class MoiveListWidget extends StatelessWidget {
  final dynamic movieList;

  const MoiveListWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    final movies = movieList.movies;
    return SizedBox(
      height: 201.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        itemCount: movies.length,
        itemBuilder: (context, index) => MovieCardWidget(movie: movies[index]),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
      ),
    );
  }
}
