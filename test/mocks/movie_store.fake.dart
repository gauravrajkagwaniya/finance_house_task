import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/model/movie/trailer.dart';
import 'package:finance_house_task/utils/enum.dart';
import 'package:mockito/annotations.dart';
import 'favorites_service.fake.dart';
import 'movie_service.fake.dart';

@GenerateNiceMocks([MockSpec<MovieStore>(onMissingStub: OnMissingStub.returnDefault )])
class MovieStore {
  List<Movie> popularMovieList = [];

  List<Movie> nowPlayingMovieList = [];

  List<Movie> topRatedMovieList = [];

  List<Movie> searchedMovies = [];

  List<Movie> favMovies = [];

  Movie? movieDetails;

  bool isLoadingPopular = false;

  bool isLoadingNowPlaying = false;

  bool isLoadingTopRated = false;

  bool isLoadingDetails = false;

  bool isLoadingQuery = false;

  bool isTrailerLoading = false;

  // Pagination related state variables

  int popularPage = 0;

  int topRatedPage = 0;

  int nowPlayingPage = 0;

  int searchPage = 0;

  int totalSearchPage = 0;

  List<Trailer>? trailers;

  bool isFavMovie = false;

  // Computed property to check if a movie is marked as a favorite

  Iterable<int> get favMovieIdList => favMovies.map((favMovie) => favMovie.id);

  // Computed property to check if all movie sections have finished loading

  bool get isAllLoaded =>
      isLoadingTopRated && isLoadingNowPlaying && isLoadingPopular;

  // Action to fetch movies for a specific section (popular, now playing, or top rated)
  Future<void> fetchMovieListOnDemand(MovieSectionsEnum movieSectionsEnum) {
    switch (movieSectionsEnum) {
      case MovieSectionsEnum.popularMovies:
        return getPopularMovies();
      case MovieSectionsEnum.nowPlaying:
        return getNowPlaying();
      case MovieSectionsEnum.topRatedMovies:
        return getTopRated();
      case MovieSectionsEnum.favoriteMovie:
        return getFavMovieList();
    }
  }

  // Returns the movie list for the given section
  List<Movie> getMovieListOnDemand(MovieSectionsEnum movieSectionsEnum) {
    switch (movieSectionsEnum) {
      case MovieSectionsEnum.popularMovies:
        return popularMovieList;
      case MovieSectionsEnum.nowPlaying:
        return nowPlayingMovieList;
      case MovieSectionsEnum.topRatedMovies:
        return topRatedMovieList;
      case MovieSectionsEnum.favoriteMovie:
        return favMovies;
    }
  }

  // Fetches popular movies from the service and updates the store
  Future<void> getPopularMovies({bool isForceRefresh = false}) async {
    if (isLoadingPopular) {
      return;
    }
    isLoadingPopular = true;
    try {
      final movieData = await MovieService()
          .getPopularMovies(pageNo: isForceRefresh ? 1 : popularPage + 1);
      if (movieData == null) {
        return;
      }
      final movieList = movieData['data'];
      popularPage = movieData['page'];

      // If it's a forced refresh, reset the movie list
      if (isForceRefresh) {
        popularMovieList = movieList ?? [];
      } else {
        popularMovieList = [...popularMovieList, ...?movieList];
      }

      // Remove duplicates from the list
      helperFunRemoveDuplicates(popularMovieList);
    } catch (e) {
      //todo handle error and toast
    } finally {
      isLoadingPopular = false;
    }
  }

  // Fetches movies that are currently playing in theaters
  Future<void> getNowPlaying(
      {int pageNo = 1, bool isForceRefresh = false}) async {
    if (isLoadingNowPlaying) {
      return;
    }
    isLoadingNowPlaying = true;
    try {
      final movieData = await MovieService()
          .getNowPlaying(pageNo: isForceRefresh ? 1 : nowPlayingPage + 1);
      final movieList = movieData?['data'];
      nowPlayingPage = movieData?['page'];

      // Update the now playing movie list
      if (isForceRefresh) {
        nowPlayingMovieList = movieList ?? [];
      } else {
        nowPlayingMovieList = [...nowPlayingMovieList, ...?movieList];
      }

      // Remove duplicates
      helperFunRemoveDuplicates(nowPlayingMovieList);
    } catch (e) {
      return;
    } finally {
      isLoadingNowPlaying = false;
    }
  }

  // Fetches top-rated movies from the service
  Future<void> getTopRated(
      {int pageNo = 1, bool isForceRefresh = false}) async {
    if (isLoadingTopRated) {
      return;
    }
    isLoadingTopRated = true;
    try {
      final movieData = await MovieService()
          .getTopRated(pageNo: isForceRefresh ? 1 : topRatedPage + 1);
      if (movieData == null) return; // suppressing error for page 2 and more
      final movieList = movieData['data'];
      topRatedPage = movieData['page'];

      // Update the top-rated movie list
      if (isForceRefresh) {
        topRatedMovieList = movieList ?? [];
      } else {
        topRatedMovieList = [...topRatedMovieList, ...?movieList];
      }
      // Remove duplicates
      helperFunRemoveDuplicates(topRatedMovieList);
    } catch (e) {
      return;
    } finally {
      isLoadingTopRated = false;
    }
  }

  // Helper function to get the first two movies from each list
  List<Movie> getFirstTwoFromEach() {
    List<Movie> firstTwo(List<Movie> list) => list.take(2).toList();
    return [
      ...firstTwo(popularMovieList),
      ...firstTwo(topRatedMovieList),
      ...firstTwo(nowPlayingMovieList)
    ];
  }

  // Computed property to get the featured movies (first two from each list)

  List<Movie> get featuredMovie => getFirstTwoFromEach();

  // Refreshes all movie lists by forcing a refresh of popular, now playing, and top-rated movies
  Future<void> refreshMovieData() async {
    getPopularMovies(isForceRefresh: true);
    getNowPlaying(isForceRefresh: true);
    getTopRated(isForceRefresh: true);
  }

  // Fetches detailed information for a specific movie
  Future<void> getMoviesDetails(int movieId) async {
    movieDetails = null;
    try {
      final data = await MovieService().getMovieDetails(movieId);
      movieDetails = data ;
    } catch (e) {}
  }

  // Fetches a list of searched movies based on a query
  Future<void> getSearchedMovie(
      {String query = "", bool isQueryNew = false}) async {
    isLoadingQuery = true;
    if (isQueryNew) {
      searchedMovies = [];
      searchPage = 0;
    }
    try {
      final movieData = await MovieService()
          .getSearchedMovie(pageNo: searchPage + 1, query: query);
      if (movieData == null) return;
      final movieList = movieData['data'];
      searchPage = movieData['page'];
      totalSearchPage = movieData['total_pages'];
      if (searchPage <= totalSearchPage) {
        searchedMovies = [...searchedMovies, ...?movieList];
      }

      // Remove duplicates from the searched list
      helperFunRemoveDuplicates(searchedMovies);
    } finally {
      isLoadingQuery = false;
    }
  }

  // Fetches trailers for a specific movie
  Future<void> getTrailers() async {
    try {
      trailers = [];
      if (movieDetails != null) {
        isTrailerLoading = true;
        final data = await MovieService().getTrailer(movieDetails!.id);
        trailers = data;
      }
    } finally {
      isTrailerLoading = false;
    }
  }

// Helper function to remove duplicate movies based on their ID
  void helperFunRemoveDuplicates(List<Movie> movie) {
    final ids = movie.map((movie) => movie.id).toSet();
    movie.retainWhere((movie) => ids.remove(movie.id));
  }

  // Fetch the list of favorite movies from storage

  Future<void> getFavMovieList() async {
    favMovies = await FavMovieService().getAllFavMovie();
  }

// Adds a movie to the list of favorites
  Future<void> addToFav(Movie movie) async {
    await FavMovieService().addFavMovie(movie);
    favMovies = [...favMovies, movie];
  }

// Removes a movie from the list of favorites
  Future<void> removeFav(Movie movie) async {
    await FavMovieService().removeFavMovie(movie);
    favMovies.remove(movie);
    favMovies = List.from(favMovies);
  }
}
