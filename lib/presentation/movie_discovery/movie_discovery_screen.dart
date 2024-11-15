import '../../global.dart';
import '../../store/root_store.dart';
import '../../utils/enum.dart';
import '../common_widgets/custom_carousel.dart';
import '../common_widgets/media_type_sections.dart';

class MovieDiscoveryScreen extends StatelessWidget {
  const MovieDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreObserver(builder: (RootStore store, context) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: store.movieStore.refreshMovieData,
            child: SingleChildScrollView(
              child: store.movieStore.isAllLoaded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 400.0),
                      child: UtilMethods.getSimmerTvWidget(
                        context: context,
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 65,),
                        CustomCarousel(
                          customHeight:
                              UtilMethods.mediaSize(context).width * 0.99,
                          store: store,
                        ),
                        MediaTypeSection(
                            movieSectionsEnum: MovieSectionsEnum.popularMovies,
                            store: store,
                            movies: store.movieStore.popularMovieList),
                        MediaTypeSection(
                            movieSectionsEnum: MovieSectionsEnum.nowPlaying,
                            store: store,
                            movies: store.movieStore.nowPlayingMovieList),
                        MediaTypeSection(
                            movieSectionsEnum: MovieSectionsEnum.topRatedMovies,
                            store: store,
                            movies: store.movieStore.topRatedMovieList),
                      ],
                    ),
            ),
          ),
        );
      }),
    );
  }
}
