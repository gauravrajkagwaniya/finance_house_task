import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import '../../global.dart';
import '../../store/root_store.dart';
import '../../utils/enum.dart';
import '../common_widgets/custom_carousel.dart';
import '../common_widgets/media_type_sections.dart';
import '../common_widgets/movie_big_card.dart';

class MovieListingScreen extends StatelessWidget {
  const MovieListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreObserver(builder: (RootStore store, context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Switch(
                value: store.themeStore.isDarkMode,
                onChanged: (value) {
                  store.themeStore.toggleTheme();
                },
                activeTrackColor: Colors.grey[700],
                inactiveTrackColor: Colors.grey[300],
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.white,
                thumbIcon: store.themeStore.isDarkMode
                    ? WidgetStateProperty.all(
                        const Icon(Icons.nightlight_round, color: Colors.white))
                    : WidgetStateProperty.all(
                        const Icon(Icons.wb_sunny, color: Colors.orange)),
              ),
              SizedBox(width: 18,)
            ],
          ),
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
