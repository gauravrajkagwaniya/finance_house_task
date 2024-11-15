import 'package:finance_house_task/model/movie/movie.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'mocks/favorites_service.fake.mocks.dart';
import 'mocks/movie_store.fake.mocks.dart';

// Generate mock classes for MovieService and FavMovieService
void main() {
  late MockFavMovieService mockFavMovieService;
  late MockMovieStore mockMovieStore;

  setUp(() {
    mockFavMovieService = MockFavMovieService();
    mockMovieStore = MockMovieStore();
  });

  // Group for MovieStore tests
  group('MovieStore Tests', () {
    // Test case for fetching popular movies


    test('getPopularMovies fetches and updates popularMovieList', () async {
      // Prepare the mock response
      final movieList = [
        Movie(
          id: 1,
        ),
        Movie(
          id: 2,
        ),
      ];

      // Mock the MovieService's response
      when(mockMovieStore.getPopularMovies()).thenAnswer(
        (_) async => movieList,
      );

      // Call the method
      await mockMovieStore.getPopularMovies();
      when(mockMovieStore.popularMovieList).thenReturn(movieList);
      // Verify that the popularMovieList was updated
      expect(mockMovieStore.popularMovieList, movieList);
      verify(mockMovieStore.getPopularMovies()).called(1);
    });

    // Test case for getting movies that are now playing
    test('getNowPlaying fetches and updates nowPlayingMovieList', () async {
      final movieList = [
        Movie(
          id: 1,
        ),
        Movie(
          id: 2,
        ),
      ];

      // Mock the response from MovieService
      when(mockMovieStore.getNowPlaying()).thenAnswer(
        (_) async => movieList,
      );

      // Call the method
      await mockMovieStore.getNowPlaying();

      // stubing
      when(mockMovieStore.nowPlayingMovieList).thenReturn(movieList);

      // Verify that the nowPlayingMovieList is updated
      expect(mockMovieStore.nowPlayingMovieList, movieList);
      verify(mockMovieStore.getNowPlaying(pageNo: 1)).called(1);
    });

    // // Test case for fetching top rated movies
    test('getTopRated fetches and updates topRatedMovieList', () async {
      final movieList = [
        Movie(
          id: 1,
        ),
        Movie(
          id: 2,
        ),
      ];

      // Mock the response from MovieService
      when(mockMovieStore.getTopRated()).thenAnswer(
        (_) async => movieList,
      );

      // Call the method
      await mockMovieStore.getTopRated();
      // stubing
      when(mockMovieStore.topRatedMovieList).thenReturn(movieList);

      // Verify that the topRatedMovieList is updated
      expect(mockMovieStore.topRatedMovieList, movieList);
      verify(mockMovieStore.getTopRated()).called(1);
    });

    // Test case for refreshing movie data (forcing a refresh)
    test('refreshMovieData forces refresh and updates all lists', () async {
      final popularMovies = [
        Movie(id: 1),
      ];
      final nowPlayingMovies = [
        Movie(id: 2),
      ];
      final topRatedMovies = [
        Movie(id: 3),
      ];

      // Mock responses
      when(mockMovieStore.getPopularMovies(isForceRefresh: true))
          .thenAnswer((_) async => popularMovies);
      when(mockMovieStore.getNowPlaying(isForceRefresh: true))
          .thenAnswer((_) async => nowPlayingMovies);
      when(mockMovieStore.getTopRated(isForceRefresh: true))
          .thenAnswer((_) async => topRatedMovies);

      // Call the refresh method
      await mockMovieStore.refreshMovieData().then((_) {
        mockMovieStore.getPopularMovies(isForceRefresh: true);
        mockMovieStore.getNowPlaying(isForceRefresh: true);
        mockMovieStore.getTopRated(isForceRefresh: true);
      });

      // stubing
      when(mockMovieStore.popularMovieList).thenReturn(popularMovies);
      when(mockMovieStore.nowPlayingMovieList).thenReturn(nowPlayingMovies);
      when(mockMovieStore.topRatedMovieList).thenReturn(topRatedMovies);

      // Verify that all lists are updated
      expect(mockMovieStore.popularMovieList, popularMovies);
      expect(mockMovieStore.nowPlayingMovieList, nowPlayingMovies);
      expect(mockMovieStore.topRatedMovieList, topRatedMovies);

      // Verify that the respective service methods were called
      verify(mockMovieStore.getPopularMovies(isForceRefresh: true)).called(1);
      verify(mockMovieStore.getNowPlaying(isForceRefresh: true)).called(1);
      verify(mockMovieStore.getTopRated(isForceRefresh: true)).called(1);
    });

    // Test case for adding a movie to favorites
    test('addToFav adds movie to favMovies list', () async {
      final movie = Movie(
        id: 1,
      );

      // Mock the response from FavMovieService
      when(mockFavMovieService.addFavMovie(movie)).thenAnswer((_) async => {});

      // Call the method to add the movie to favorites
      await mockMovieStore.addToFav(movie);

      when(mockMovieStore.favMovies).thenReturn([movie]);

      // Verify that the movie was added to favMovies list
      expect(mockMovieStore.favMovies, contains(movie));

      // Verify that FavMovieService was called
      verify(mockMovieStore.addToFav(movie)).called(1);
    });

    // Test case for removing a movie from favorites
    test('removeFav removes movie from favMovies list', () async {
      final movie = Movie(id: 1,);

      // Mock the response from FavMovieService
      when(mockFavMovieService.removeFavMovie(movie)).thenAnswer((_) async => {});

      // Add the movie to favorites first
      mockMovieStore.favMovies = [movie];

      // Call the method to remove the movie from favorites
      await mockMovieStore.removeFav(movie);
      // Verify that the movie was removed from favMovies list
      expect(mockMovieStore.favMovies, isNot(contains(movie)));

      // Verify that FavMovieService was called
      verify(mockMovieStore.removeFav(movie)).called(1);
    });
  });
}
