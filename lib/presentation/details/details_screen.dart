import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/presentation/details/production_companies.dart';
import 'package:finance_house_task/presentation/details/trailers_section.dart';
import 'package:finance_house_task/store/root_store.dart';
import '../../global.dart';
import '../common_widgets/backdrop_img.dart';
import '../common_widgets/image_cache_custom.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Provider.of<RootStore>(context, listen: true)
        .movieStore
        .getMoviesDetails(movie.id);

    return Scaffold(
      body: StoreObserver(builder: (RootStore store, context) {
        final Movie? movieDetail = store.movieStore.movieDetails;
        final bool isFavMovie = movieDetail != null
            ? store.movieStore.favMovieIdList.contains(movieDetail.id)
            : false;

        return movieDetail == null
            ? UtilMethods.getSimmerTvWidget(context: context)
            : BackdropImg(
                backdropPath: movieDetail.backdropPath,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //poster and play, fav
                      Container(
                        height: UtilMethods.mediaSize(context).height / 1.6,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 200,
                              offset: Offset(15, 10),
                              spreadRadius: 50)
                        ]),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background image
                            ImageCacheCustom(
                              url: movieDetail.posterPath != null
                                  ? UtilMethods.imgUrl(
                                      movieDetail.posterPath ?? '')
                                  : AssetsLinks.imgPlaceholder,
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
                            // Gradient overlay for bottom to top
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.6),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),

                            // Title, Genre, and IcButtons
                            Positioned(
                              bottom: 20,
                              left: 20,
                              right: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: () {
                                          // Play button action
                                        },
                                        style: ElevatedButton.styleFrom(),
                                        icon: const Icon(Icons.play_arrow),
                                        label: const Text('Play'),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () {
                                          store.movieStore.addToFav(movie);
                                        },
                                        icon: SvgPicture.asset(
                                          isFavMovie
                                              ? AssetsLinks.favoriteFill
                                              : AssetsLinks.favorite,
                                          color: Styles.netflixColors,
                                        ),
                                        color: Styles.netflixColors,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: 25,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: movieDetail.genres == null
                                          ? 0
                                          : movieDetail.genres!.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          "${movieDetail.genres?[index].name}${index == movieDetail.genres!.length - 1 ? "" : " • "}",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            fontSize: 14,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                blurRadius: 6,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // a slik white shadow
                      Container(
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          // BoxShape.circle or BoxShape.retangle
                          //color: const Color(0xFF66BB6A),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 24.0,
                            ),
                          ],
                        ),
                      ),

                      // movie releated data name, des, release date , rating
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            Text(
                              movieDetail.title!,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                movieDetail.overview!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Release Date: ${movieDetail.releaseDate}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                        "User Rating: ${movieDetail.voteAverage?.ceil()}/10",
                                        style: const TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),

                            /// Production Companies
                            movieDetail.productionCompanies != null
                                ? ProductionCompanies(movieDetail: movieDetail)
                                : Container(),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
      }),
      floatingActionButton: StoreObserver(builder: (RootStore store, context) {
        return store.movieStore.movieDetails != null
            ? FloatingActionButton(
                /// Trailers
                onPressed: () {
                  store.movieStore.getTrailers();
                  UtilMethods.showBottomSheet(context, const TrailersSection());
                },
                tooltip: "Watch Trailers",
                child: const Icon(FontAwesomeIcons.film),
              )
            : Container();
      }),
    );
  }
}
