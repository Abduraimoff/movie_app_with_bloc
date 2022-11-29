import 'package:movie_app/utils/export_pack.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 61.h,
      left: 21.w,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.55),
          ),
          child: const Center(
            child: Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
