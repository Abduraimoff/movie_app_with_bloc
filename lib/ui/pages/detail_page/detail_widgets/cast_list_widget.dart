import 'package:movie_app/ui/pages/detail_page/detail_widgets/cast_card_widget.dart';
import 'package:movie_app/utils/export_pack.dart';

class CastListWidget extends StatelessWidget {
  const CastListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => const CastCardWidget(),
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
      ),
    );
  }
}
