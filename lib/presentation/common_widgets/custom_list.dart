import 'package:finance_house_task/presentation/common_widgets/backdrop_img.dart';

import '../../global.dart';
import '../../model/movie/movie.dart';
import 'image_cache_custom.dart';


class CustomList extends StatelessWidget {
  final Movie movie;

  const CustomList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: SizedBox(
        height: UtilMethods
            .mediaSize(context)
            .height * .18,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropImg(backdropPath: movie.backdropPath,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                movie.posterPath!.isNotEmpty
                    ? ImageCacheCustom(
                    url: UtilMethods.imgUrl(movie.posterPath!),
                )
                    : Image.asset(AssetsLinks.imgPlaceholder),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(movie.title!,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade)),

                      const SizedBox(height: 5),
                      Text(
                        '⭐ ${movie.voteAverage?.ceil()}/10',
                        style: const TextStyle(color: Colors.amber),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              // Play button action
                            },
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.white,
                              // onPrimary: Colors.black,
                            ),
                            label: const Text('Watch Now'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
