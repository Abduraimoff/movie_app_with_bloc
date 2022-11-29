import '../../../utils/export_pack.dart';
import 'detail_widgets/back_button_widget.dart';
import 'detail_widgets/cast_list_widget.dart';
import 'detail_widgets/pay_button_widget.dart';
import 'detail_widgets/rating_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 450.h,
                  width: double.infinity,
                  child: Image.network(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
                    fit: BoxFit.cover,
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
                  children: const [
                    _TitleWidget(),
                    _SubtitleWidget(),
                    RatingWidget(),
                    _DescriptionWidget(),
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
  const _DescriptionWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          'Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.',
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
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Text(
          'Black Adam (2022)',
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
  const _SubtitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '2021    Action-Adventure-Fantasy    2h36m',
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
