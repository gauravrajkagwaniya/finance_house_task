
import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/presentation/details/details_screen.dart';

import '../../global.dart';
import 'image_cache_custom.dart';


class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: 10,onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie),));
    },
      child: SizedBox(
        width: UtilMethods.mediaSize(context).width*.30,
        child: Stack(
          alignment: AlignmentDirectional.center,fit: StackFit.passthrough,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: movie.posterPath != null?ImageCacheCustom(
                  url:  UtilMethods.imgUrl(movie.posterPath!) ,
              ): Image.asset(
                AssetsLinks.imgPlaceholder ,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 2,
              left: 0,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title??"",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '⭐ ${movie.voteAverage?.ceil()}/10',
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 6,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
