import '../../global.dart';
import '../../model/movie/movie.dart';
import 'image_cache_custom.dart';

class MovieBigCard extends StatelessWidget {
  final Movie movie;

  const MovieBigCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Background image
        ImageCacheCustom(
          url: UtilMethods.imgUrl(movie.posterPath ?? ""),
              width: double.infinity,
              height: double.infinity,
            ),
            // Image color shadow overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: RadialGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  center: Alignment.center,
                  radius: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
