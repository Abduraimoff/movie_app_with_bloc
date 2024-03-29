import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/utils/export_pack.dart';

class RatingWidget extends StatelessWidget {
  final double votes;
  const RatingWidget({super.key, required this.votes});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: votes,
      minRating: 1,
      unratedColor: Colors.white,
      itemSize: 14,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 3.0.w),
      itemBuilder: (context, _) {
        return const Icon(
          Icons.star,
          color: AppColors.ratingColor,
        );
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
