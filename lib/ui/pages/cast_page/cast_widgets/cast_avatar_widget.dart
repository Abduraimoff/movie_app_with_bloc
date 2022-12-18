import 'package:movie_app/utils/export_pack.dart';
import 'package:transparent_image/transparent_image.dart';

class CastAvatarWidget extends StatelessWidget {
  const CastAvatarWidget({
    Key? key,
    required String notFoundImg,
    required String imageUrl,
  })  : _notFoundImg = notFoundImg,
        _imageUrl = imageUrl,
        super(key: key);

  final String _notFoundImg;
  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: FadeInImage.memoryNetwork(
            fadeInDuration: const Duration(milliseconds: 200),
            imageErrorBuilder: (context, error, stackTrace) => Image.network(
              _notFoundImg,
              fit: BoxFit.cover,
            ),
            placeholder: kTransparentImage,
            image: _imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
