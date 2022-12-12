import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/casts_bloc/casts_bloc.dart';
import 'package:movie_app/ui/pages/detail_page/detail_widgets/cast_card_widget.dart';
import 'package:movie_app/utils/export_pack.dart';

class CastListWidget extends StatelessWidget {
  const CastListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CastsBloc>().state;
    return SizedBox(
      height: 65.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: state.casts?.length ?? 0,
        itemBuilder: (context, index) => CastCardWidget(
          cast: state.casts![index],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 5.w),
      ),
    );
  }
}
