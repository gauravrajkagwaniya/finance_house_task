import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import '../../global.dart';

class ImageCacheCustom extends StatelessWidget {
  final String url;
  final double height;
  final double width;

  const ImageCacheCustom(
      {super.key, required this.url, this.height = 150, this.width = 150});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FastCachedImage(
        url: url,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(seconds: 1),
        errorBuilder: (context, exception, stacktrace) {
          return const Text( "Image Unavailable");
        },
        loadingBuilder: (context, progress) {
          return UtilMethods.getSimmerWidget(
            context: context,
            height: height,
            width: width,
          );
        },
      ),
    );
  }
}
