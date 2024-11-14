import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/service/cache_service.dart';
import 'package:finance_house_task/service/fav_movie_service.dart';
import 'package:finance_house_task/service/movie_service.dart';
import 'package:finance_house_task/store/root_store.dart';
import 'package:mobx/mobx.dart';

import '../model/movie/movie.dart';
import '../model/movie/trailer.dart';
import '../utils/enum.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  final RootStore rootStore;

  // Constructor that initializes the store and fetches movie data
  _MovieStore({required this.rootStore}) {
    getPopularMovies();
    getNowPlaying();
    getTopRated();
  }

  // Observable properties to hold movie lists and other state values
  @observable
  List<Movie> popularMovieList = [];
  @observable
  List<Movie> nowPlayingMovieList = [];
  @observable
  List<Movie> topRatedMovieList = [];
  @observable
  List<Movie> searchedMovies = [];
  @observable
  List<Movie> favMovies = [];

  @observable
  Movie? movieDetails;

  @observable
  bool isLoadingPopular = false;
  @observable
  bool isLoadingNowPlaying = false;
  @observable
  bool isLoadingTopRated = false;
  @observable
  bool isLoadingDetails = false;
  @observable
  bool isLoadingQuery = false;

  // Pagination related state variables
  @observable
  int popularPage = 0;
  @observable
  int topRatedPage = 0;
  @observable
  int nowPlayingPage = 0;
  @observable
  int searchPage = 0;
  @observable
  int totalSearchPage = 0;

  @observable
  List<Trailer>? trailers;

  @observable
  bool isFavMovie = false;

  // Computed property to check if a movie is marked as a favorite
  @computed
  bool get isMovieFav =>
      favMovies.any((favMovie) => favMovie.id == movieDetails?.id);

  // Computed property to check if all movie sections have finished loading
  @computed
  bool get isAllLoaded =>
      isLoadingTopRated && isLoadingNowPlaying && isLoadingPopular;

  // Action to fetch movies for a specific section (popular, now playing, or top rated)
  @action
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
        // getCacheMovieList(MovieSectionsEnum.popularMovies);
        return popularMovieList;
      case MovieSectionsEnum.nowPlaying:
        // getCacheMovieList(MovieSectionsEnum.nowPlaying);
        return nowPlayingMovieList;
      case MovieSectionsEnum.topRatedMovies:
        // getCacheMovieList(MovieSectionsEnum.topRatedMovies);
        return topRatedMovieList;
      case MovieSectionsEnum.favoriteMovie:
        return favMovies;
    }
  }

  // Fetches popular movies from the service and updates the store
  @action
  Future<void> getPopularMovies({bool isForceRefresh = false}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      if (isLoadingPopular) {
        return;
      }
      isLoadingPopular = true;
      try {
        final movieData = await MovieService()
            .getPopularMovies(pageNo: isForceRefresh ? 1 : popularPage + 1);
        final movieList = movieData['data'];
        popularPage = movieData['page'];
        UtilMethods.kPrintMessage("Popular page::  $popularPage");

        // If it's a forced refresh, reset the movie list
        if (isForceRefresh) {
          popularMovieList = movieList ?? [];
        } else {
          popularMovieList = [...popularMovieList, ...?movieList];
        }

        UtilMethods.kPrintMessage(
            "popularMovieList::  ${popularMovieList.length}");

        // Remove duplicates from the list
        helperFunRemoveDupli(popularMovieList);
      } catch (e) {
        final data = await CacheService().getStringToObj(CacheService.popularDataKey);
        if (data != null) {
          popularMovieList = data;
        }
      } finally {
        isLoadingPopular = false;
      }
    } else {
      final data = await CacheService().getStringToObj(CacheService.popularDataKey);
      if (data != null) {
        popularMovieList = data;
      }
    }
  }

  // Fetches movies that are currently playing in theaters
  @action
  Future<void> getNowPlaying(
      {int pageNo = 1, bool isForceRefresh = false}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      if (isLoadingNowPlaying) {
        return;
      }
      isLoadingNowPlaying = true;
      try {
        final movieData = await MovieService()
            .getNowPlaying(pageNo: isForceRefresh ? 1 : nowPlayingPage + 1);
        final movieList = movieData['data'];
        nowPlayingPage = movieData['page'];
        UtilMethods.kPrintMessage("nowPlayingPage ::  $nowPlayingPage");

        // Update the now playing movie list
        if (isForceRefresh) {
          nowPlayingMovieList = movieList ?? [];
        } else {
          nowPlayingMovieList = [...nowPlayingMovieList, ...?movieList];
        }

        // Remove duplicates
        helperFunRemoveDupli(nowPlayingMovieList);
        UtilMethods.kPrintMessage(
            "nowPlayingMovieList::  ${nowPlayingMovieList.length}");
      } catch (e) {
        final data =
            await CacheService().getStringToObj(CacheService.nowPlayingDataKey);
        if (data != null) {
          nowPlayingMovieList = data;
        }
      } finally {
        isLoadingNowPlaying = false;
      }
    } else {
      final data = await CacheService().getStringToObj(CacheService.nowPlayingDataKey);
      if (data != null) {
        nowPlayingMovieList = data;
      }
    }
  }

  // Fetches top-rated movies from the service
  @action
  Future<void> getTopRated(
      {int pageNo = 1, bool isForceRefresh = false}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      if (isLoadingTopRated) {
        return;
      }
      isLoadingTopRated = true;
      try {
        final movieData = await MovieService()
            .getTopRated(pageNo: isForceRefresh ? 1 : topRatedPage + 1);
        final movieList = movieData['data'];
        topRatedPage = movieData['page'];
        UtilMethods.kPrintMessage("topRatedMovieList page::  $topRatedPage");

        // Update the top-rated movie list
        if (isForceRefresh) {
          topRatedMovieList = movieList ?? [];
        } else {
          topRatedMovieList = [...topRatedMovieList, ...?movieList];
        }

        // Remove duplicates
        helperFunRemoveDupli(topRatedMovieList);
      } catch (e) {
        final data = await CacheService().getStringToObj(CacheService.topRatedDataKey);
        if (data != null) {
          topRatedMovieList = data;
        }
      } finally {
        isLoadingTopRated = false;
      }
    } else {
      final data = await CacheService().getStringToObj(CacheService.topRatedDataKey);
      if (data != null) {
        topRatedMovieList = data;
      }
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
  @computed
  List<Movie> get featuredMovie => getFirstTwoFromEach();

  // Refreshes all movie lists by forcing a refresh of popular, now playing, and top-rated movies
  @action
  Future<void> refreshMovieData() async {
    getPopularMovies(isForceRefresh: true);
    getNowPlaying(isForceRefresh: true);
    getTopRated(isForceRefresh: true);
  }

  // Fetches detailed information for a specific movie
  @action
  Future<void> getMoviesDetails(int movieId) async {
    movieDetails = null;
    try {
      final data = await MovieService().getMovieDetails(movieId: movieId);
      movieDetails = data ?? null;
    } catch (e) {
      print(e);
    }
  }

  // Fetches a list of searched movies based on a query
  @action
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
      final movieList = movieData['data'];
      searchPage = movieData['page'];
      totalSearchPage = movieData['total_pages'];
      if (searchPage <= totalSearchPage) {
        searchedMovies = [...searchedMovies, ...?movieList];
      }

      // Remove duplicates from the searched list
      helperFunRemoveDupli(searchedMovies);
      UtilMethods.kPrintMessage(
          "Search Query: $query, Page No: $searchPage, Total Pages: $totalSearchPage, Searched Movies: ${searchedMovies.length}");
    } catch (e) {
      UtilMethods.kPrintMessage("Error getSearchedMovie: " + e.toString());
    } finally {
      isLoadingQuery = false;
    }
  }

  // Fetches trailers for a specific movie
  @action
  Future<void> getTrailers(int movieId) async {
    final data = await MovieService().getTrailer(movieId: movieId);
    trailers = data;
  }

  // Helper function to remove duplicate movies based on their ID
  void helperFunRemoveDupli(List<Movie> movie) {
    final ids = movie.map((movie) => movie.id).toSet();
    movie.retainWhere((movie) => ids.remove(movie.id));
  }

  // Fetch the list of favorite movies from storage
  @action
  Future<void> getFavMovieList() async {
    favMovies = await FavMovieService().getAllFavMovie();
  }

  // Adds a movie to the list of favorites
  @action
  Future<void> addToFav(Movie movie) async {
    await FavMovieService().addFavMovie(movie: movie);
    isFavMovie = true;
  }

  // Removes a movie from the list of favorites
  @action
  Future<void> removeFav({int? index, required Movie movie}) async {
    if (index != null) {
      favMovies.removeAt(index);
    }
    await FavMovieService().removeFavMovie(movie);
    isFavMovie = false;
  }
}
