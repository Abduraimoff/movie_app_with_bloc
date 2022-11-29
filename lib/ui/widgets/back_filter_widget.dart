import 'dart:ui';

import 'package:movie_app/utils/export_pack.dart';

class BackFilterWidget extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Color color;

  const BackFilterWidget({
    Key? key,
    this.top,
    // ignore: unused_element
    this.left,
    // ignore: unused_element
    this.right,
    // ignore: unused_element
    this.bottom,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: 165.w,
        height: 165.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
          child: Container(
            width: 165.w,
            height: 165.h,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
