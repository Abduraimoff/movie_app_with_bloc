import 'package:movie_app/ui/pages/home_page/home_widgets/movie_card_widget.dart';
import 'package:movie_app/utils/export_pack.dart';

class MoiveListWidget extends StatelessWidget {
  const MoiveListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 161.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        itemCount: 7,
        itemBuilder: (context, index) => const MovieCardWidget(),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
      ),
    );
  }
}
