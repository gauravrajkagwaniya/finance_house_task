// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  Computed<bool>? _$isMovieFavComputed;

  @override
  bool get isMovieFav =>
      (_$isMovieFavComputed ??= Computed<bool>(() => super.isMovieFav,
              name: '_MovieStore.isMovieFav'))
          .value;
  Computed<bool>? _$isAllLoadedComputed;

  @override
  bool get isAllLoaded =>
      (_$isAllLoadedComputed ??= Computed<bool>(() => super.isAllLoaded,
              name: '_MovieStore.isAllLoaded'))
          .value;
  Computed<List<Movie>>? _$featuredMovieComputed;

  @override
  List<Movie> get featuredMovie => (_$featuredMovieComputed ??=
          Computed<List<Movie>>(() => super.featuredMovie,
              name: '_MovieStore.featuredMovie'))
      .value;

  late final _$popularMovieListAtom =
      Atom(name: '_MovieStore.popularMovieList', context: context);

  @override
  List<Movie> get popularMovieList {
    _$popularMovieListAtom.reportRead();
    return super.popularMovieList;
  }

  @override
  set popularMovieList(List<Movie> value) {
    _$popularMovieListAtom.reportWrite(value, super.popularMovieList, () {
      super.popularMovieList = value;
    });
  }

  late final _$nowPlayingMovieListAtom =
      Atom(name: '_MovieStore.nowPlayingMovieList', context: context);

  @override
  List<Movie> get nowPlayingMovieList {
    _$nowPlayingMovieListAtom.reportRead();
    return super.nowPlayingMovieList;
  }

  @override
  set nowPlayingMovieList(List<Movie> value) {
    _$nowPlayingMovieListAtom.reportWrite(value, super.nowPlayingMovieList, () {
      super.nowPlayingMovieList = value;
    });
  }

  late final _$topRatedMovieListAtom =
      Atom(name: '_MovieStore.topRatedMovieList', context: context);

  @override
  List<Movie> get topRatedMovieList {
    _$topRatedMovieListAtom.reportRead();
    return super.topRatedMovieList;
  }

  @override
  set topRatedMovieList(List<Movie> value) {
    _$topRatedMovieListAtom.reportWrite(value, super.topRatedMovieList, () {
      super.topRatedMovieList = value;
    });
  }

  late final _$searchedMoviesAtom =
      Atom(name: '_MovieStore.searchedMovies', context: context);

  @override
  List<Movie> get searchedMovies {
    _$searchedMoviesAtom.reportRead();
    return super.searchedMovies;
  }

  @override
  set searchedMovies(List<Movie> value) {
    _$searchedMoviesAtom.reportWrite(value, super.searchedMovies, () {
      super.searchedMovies = value;
    });
  }

  late final _$favMoviesAtom =
      Atom(name: '_MovieStore.favMovies', context: context);

  @override
  List<Movie> get favMovies {
    _$favMoviesAtom.reportRead();
    return super.favMovies;
  }

  @override
  set favMovies(List<Movie> value) {
    _$favMoviesAtom.reportWrite(value, super.favMovies, () {
      super.favMovies = value;
    });
  }

  late final _$movieDetailsAtom =
      Atom(name: '_MovieStore.movieDetails', context: context);

  @override
  Movie? get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(Movie? value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  late final _$isLoadingPopularAtom =
      Atom(name: '_MovieStore.isLoadingPopular', context: context);

  @override
  bool get isLoadingPopular {
    _$isLoadingPopularAtom.reportRead();
    return super.isLoadingPopular;
  }

  @override
  set isLoadingPopular(bool value) {
    _$isLoadingPopularAtom.reportWrite(value, super.isLoadingPopular, () {
      super.isLoadingPopular = value;
    });
  }

  late final _$isLoadingNowPlayingAtom =
      Atom(name: '_MovieStore.isLoadingNowPlaying', context: context);

  @override
  bool get isLoadingNowPlaying {
    _$isLoadingNowPlayingAtom.reportRead();
    return super.isLoadingNowPlaying;
  }

  @override
  set isLoadingNowPlaying(bool value) {
    _$isLoadingNowPlayingAtom.reportWrite(value, super.isLoadingNowPlaying, () {
      super.isLoadingNowPlaying = value;
    });
  }

  late final _$isLoadingTopRatedAtom =
      Atom(name: '_MovieStore.isLoadingTopRated', context: context);

  @override
  bool get isLoadingTopRated {
    _$isLoadingTopRatedAtom.reportRead();
    return super.isLoadingTopRated;
  }

  @override
  set isLoadingTopRated(bool value) {
    _$isLoadingTopRatedAtom.reportWrite(value, super.isLoadingTopRated, () {
      super.isLoadingTopRated = value;
    });
  }

  late final _$isLoadingDetailsAtom =
      Atom(name: '_MovieStore.isLoadingDetails', context: context);

  @override
  bool get isLoadingDetails {
    _$isLoadingDetailsAtom.reportRead();
    return super.isLoadingDetails;
  }

  @override
  set isLoadingDetails(bool value) {
    _$isLoadingDetailsAtom.reportWrite(value, super.isLoadingDetails, () {
      super.isLoadingDetails = value;
    });
  }

  late final _$isLoadingQueryAtom =
      Atom(name: '_MovieStore.isLoadingQuery', context: context);

  @override
  bool get isLoadingQuery {
    _$isLoadingQueryAtom.reportRead();
    return super.isLoadingQuery;
  }

  @override
  set isLoadingQuery(bool value) {
    _$isLoadingQueryAtom.reportWrite(value, super.isLoadingQuery, () {
      super.isLoadingQuery = value;
    });
  }

  late final _$popularPageAtom =
      Atom(name: '_MovieStore.popularPage', context: context);

  @override
  int get popularPage {
    _$popularPageAtom.reportRead();
    return super.popularPage;
  }

  @override
  set popularPage(int value) {
    _$popularPageAtom.reportWrite(value, super.popularPage, () {
      super.popularPage = value;
    });
  }

  late final _$topRatedPageAtom =
      Atom(name: '_MovieStore.topRatedPage', context: context);

  @override
  int get topRatedPage {
    _$topRatedPageAtom.reportRead();
    return super.topRatedPage;
  }

  @override
  set topRatedPage(int value) {
    _$topRatedPageAtom.reportWrite(value, super.topRatedPage, () {
      super.topRatedPage = value;
    });
  }

  late final _$nowPlayingPageAtom =
      Atom(name: '_MovieStore.nowPlayingPage', context: context);

  @override
  int get nowPlayingPage {
    _$nowPlayingPageAtom.reportRead();
    return super.nowPlayingPage;
  }

  @override
  set nowPlayingPage(int value) {
    _$nowPlayingPageAtom.reportWrite(value, super.nowPlayingPage, () {
      super.nowPlayingPage = value;
    });
  }

  late final _$searchPageAtom =
      Atom(name: '_MovieStore.searchPage', context: context);

  @override
  int get searchPage {
    _$searchPageAtom.reportRead();
    return super.searchPage;
  }

  @override
  set searchPage(int value) {
    _$searchPageAtom.reportWrite(value, super.searchPage, () {
      super.searchPage = value;
    });
  }

  late final _$totalSearchPageAtom =
      Atom(name: '_MovieStore.totalSearchPage', context: context);

  @override
  int get totalSearchPage {
    _$totalSearchPageAtom.reportRead();
    return super.totalSearchPage;
  }

  @override
  set totalSearchPage(int value) {
    _$totalSearchPageAtom.reportWrite(value, super.totalSearchPage, () {
      super.totalSearchPage = value;
    });
  }

  late final _$trailersAtom =
      Atom(name: '_MovieStore.trailers', context: context);

  @override
  List<Trailer>? get trailers {
    _$trailersAtom.reportRead();
    return super.trailers;
  }

  @override
  set trailers(List<Trailer>? value) {
    _$trailersAtom.reportWrite(value, super.trailers, () {
      super.trailers = value;
    });
  }

  late final _$isFavMovieAtom =
      Atom(name: '_MovieStore.isFavMovie', context: context);

  @override
  bool get isFavMovie {
    _$isFavMovieAtom.reportRead();
    return super.isFavMovie;
  }

  @override
  set isFavMovie(bool value) {
    _$isFavMovieAtom.reportWrite(value, super.isFavMovie, () {
      super.isFavMovie = value;
    });
  }

  late final _$getPopularMoviesAsyncAction =
      AsyncAction('_MovieStore.getPopularMovies', context: context);

  @override
  Future<void> getPopularMovies({bool isForceRefresh = false}) {
    return _$getPopularMoviesAsyncAction
        .run(() => super.getPopularMovies(isForceRefresh: isForceRefresh));
  }

  late final _$getNowPlayingAsyncAction =
      AsyncAction('_MovieStore.getNowPlaying', context: context);

  @override
  Future<void> getNowPlaying({int pageNo = 1, bool isForceRefresh = false}) {
    return _$getNowPlayingAsyncAction.run(() =>
        super.getNowPlaying(pageNo: pageNo, isForceRefresh: isForceRefresh));
  }

  late final _$getTopRatedAsyncAction =
      AsyncAction('_MovieStore.getTopRated', context: context);

  @override
  Future<void> getTopRated({int pageNo = 1, bool isForceRefresh = false}) {
    return _$getTopRatedAsyncAction.run(() =>
        super.getTopRated(pageNo: pageNo, isForceRefresh: isForceRefresh));
  }

  late final _$refreshMovieDataAsyncAction =
      AsyncAction('_MovieStore.refreshMovieData', context: context);

  @override
  Future<void> refreshMovieData() {
    return _$refreshMovieDataAsyncAction.run(() => super.refreshMovieData());
  }

  late final _$getMoviesDetailsAsyncAction =
      AsyncAction('_MovieStore.getMoviesDetails', context: context);

  @override
  Future<void> getMoviesDetails(int movieId) {
    return _$getMoviesDetailsAsyncAction
        .run(() => super.getMoviesDetails(movieId));
  }

  late final _$getSearchedMovieAsyncAction =
      AsyncAction('_MovieStore.getSearchedMovie', context: context);

  @override
  Future<void> getSearchedMovie({String query = "", bool isQueryNew = false}) {
    return _$getSearchedMovieAsyncAction.run(
        () => super.getSearchedMovie(query: query, isQueryNew: isQueryNew));
  }

  late final _$getTrailersAsyncAction =
      AsyncAction('_MovieStore.getTrailers', context: context);

  @override
  Future<void> getTrailers(int movieId) {
    return _$getTrailersAsyncAction.run(() => super.getTrailers(movieId));
  }

  late final _$getFavMovieListAsyncAction =
      AsyncAction('_MovieStore.getFavMovieList', context: context);

  @override
  Future<void> getFavMovieList() {
    return _$getFavMovieListAsyncAction.run(() => super.getFavMovieList());
  }

  late final _$addToFavAsyncAction =
      AsyncAction('_MovieStore.addToFav', context: context);

  @override
  Future<void> addToFav(Movie movie) {
    return _$addToFavAsyncAction.run(() => super.addToFav(movie));
  }

  late final _$removeFavAsyncAction =
      AsyncAction('_MovieStore.removeFav', context: context);

  @override
  Future<void> removeFav({int? index, required Movie movie}) {
    return _$removeFavAsyncAction
        .run(() => super.removeFav(index: index, movie: movie));
  }

  late final _$_MovieStoreActionController =
      ActionController(name: '_MovieStore', context: context);

  @override
  Future<void> fetchMovieListOnDemand(MovieSectionsEnum movieSectionsEnum) {
    final _$actionInfo = _$_MovieStoreActionController.startAction(
        name: '_MovieStore.fetchMovieListOnDemand');
    try {
      return super.fetchMovieListOnDemand(movieSectionsEnum);
    } finally {
      _$_MovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
popularMovieList: ${popularMovieList},
nowPlayingMovieList: ${nowPlayingMovieList},
topRatedMovieList: ${topRatedMovieList},
searchedMovies: ${searchedMovies},
favMovies: ${favMovies},
movieDetails: ${movieDetails},
isLoadingPopular: ${isLoadingPopular},
isLoadingNowPlaying: ${isLoadingNowPlaying},
isLoadingTopRated: ${isLoadingTopRated},
isLoadingDetails: ${isLoadingDetails},
isLoadingQuery: ${isLoadingQuery},
popularPage: ${popularPage},
topRatedPage: ${topRatedPage},
nowPlayingPage: ${nowPlayingPage},
searchPage: ${searchPage},
totalSearchPage: ${totalSearchPage},
trailers: ${trailers},
isFavMovie: ${isFavMovie},
isMovieFav: ${isMovieFav},
isAllLoaded: ${isAllLoaded},
featuredMovie: ${featuredMovie}
    ''';
  }
}
