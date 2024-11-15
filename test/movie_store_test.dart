// // import 'package:finance_house_task/service/cache_service.dart';
// // import 'package:finance_house_task/service/isar_service.dart';
// // import 'package:finance_house_task/store/movie_store.dart';
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mockito/mockito.dart';
// // import 'package:path_provider/path_provider.dart';
// //
// //
// // import 'mocks/movie_service.fake.dart';
// //
// // void main() {
// //   TestWidgetsFlutterBinding.ensureInitialized();
// //   // Create the mock movie service
// //   late MockMovieService mockMovieService;
// //   late MovieStore movieStore;
// //   late MockRootStore mockRootStore;
// //   late MockPathProvider mockPathProvider;
// //   // Create a mock for Directory
// //   late MockDirectory mockDirectory;
// //
// //   setUp(() async {
// //
// //
// //     // Initialize other services if needed
// //     await IsarService().initializeIsar();
// //     await CacheService().initCacheImg();
// //
// //     // Mock path_provider for file system access
// //     mockDirectory = MockDirectory();
// //     mockPathProvider = MockPathProvider();
// //     // Mock the getter path to return a valid String
// //     when(mockDirectory.path).thenReturn('/mock/path');
// //
// //     // // Mock the getApplicationDocumentsDirectory to return the mock directory
// //     when(getApplicationDocumentsDirectory()).thenAnswer((_) async => mockDirectory);
// //
// //       // when(mockPathProvider.getApplicationDocumentsDirectory())
// //     //     .thenAnswer((_) async => mockDirectory);
// //     // Initialize the mock service and store before each test
// //     mockMovieService = MockMovieService();
// //     mockRootStore = MockRootStore();
// //     movieStore = MovieStore(rootStore: mockRootStore);
// //   });
// //
// //   group('MovieStore Tests', () {
// //     test('is all 3 APIs fetched', () async {
// //       // Mock the service response for popular, top rated, and now playing
// //       // You can mock these services similarly to the ones below.
// //
// //       // Trigger the fetch for all movies
// //       await movieStore.getPopularMovies();
// //       await movieStore.getTopRated();
// //       await movieStore.getNowPlaying();
// //
// //       // Validate the movie store state
// //       expect(movieStore.isAllLoaded,
// //           true); // Assuming your store is updated correctly
// //     });
// //   });
// // }
//
// // import 'package:finance_house_task/service/isar_service.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:finance_house_task/store/movie_store.dart';
// // import 'package:finance_house_task/store/root_store.dart';
// // import 'mocks/mock_services.mocks.dart';
//
//
// // void main() {
// //   late MovieStore movieStore;
//
// //   late MockMovieService mockMovieService;
// //   late MockFavMovieService mockFavMovieService;
// //   late RootStore rootStore;
//
//
// //   setUp(() async {
//
// //     await IsarService().initializeIsar();
// //     // Initialize mocks and movie store
// //     mockMovieService = MockMovieService();
// //     // mockFavMovieService = MockFavMovieService();
// //     rootStore = RootStore();
// //     //     // Initialize other services if needed
//
// //     // await CacheService().initCacheImg();
//
// //   });
//
// //   test('should fetch ppopular movie',(){
// //     const myMovieStore = rootStore.
// //     expect(actual, matcher)
// //   });
//
//   // group('MovieStore Tests', () {
//   //   test('Initial state of MovieStore', () {
//   //     expect([], isEmpty);
//   //     // expect(movieStore.nowPlayingMovieList, isEmpty);
//   //     // expect(movieStore.topRatedMovieList, isEmpty);
//   //     // expect(movieStore.favMovies, isEmpty);
//   //     // expect(movieStore.isLoadingPopular, true);
//   //   });
//
//     // test('Get Popular Movies', () async {
//     //   // Prepare mock data
//     //   final mockMovieList = [
//     //     Movie(id: 1, ),
//     //   ];
//     //   when(mockMovieService.getPopularMovies(pageNo: 1)).thenAnswer(
//     //         (_) async => {'data': mockMovieList, 'page': 1},
//     //   );
//     //
//     //   // Trigger the action to fetch popular movies
//     //   await movieStore.getPopularMovies(isForceRefresh: true);
//     //
//     //   // Verify that the popular movie list is updated
//     //   expect(movieStore.popularMovieList.length, 0);
//     //   expect(movieStore.popularMovieList[0].title, 'Popular Movie');
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockMovieService.getPopularMovies(pageNo: 1)).called(1);
//     // });
//
//     // test('Add Movie to Favorites', () async {
//     //   final movie = Movie(id: 1,);
//     //
//     //   // Simulate adding the movie to favorites
//     //   when(mockFavMovieService.addFavMovie(movie: movie)).thenAnswer((_) async {});
//     //
//     //   // Add movie to favorites
//     //   await movieStore.addToFav(movie);
//     //
//     //   // Verify the movie is in the favorites list
//     //   expect(movieStore.favMovies.length, 1);
//     //   expect(movieStore.favMovies[0].title, 'Favorite Movie');
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockFavMovieService.addFavMovie(movie: movie)).called(1);
//     // });
//
//     // test('Remove Movie from Favorites', () async {
//     //   final movie = Movie(id: 1, );
//     //
//     //   // Simulate removing the movie from favorites
//     //   when(mockFavMovieService.removeFavMovie(movie)).thenAnswer((_) async {});
//     //
//     //   // Remove movie from favorites
//     //   await movieStore.removeFav(movie);
//     //
//     //   // Verify the movie is no longer in the favorites list
//     //   expect(movieStore.favMovies.isEmpty, true);
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockFavMovieService.removeFavMovie(movie)).called(1);
//     // });
//
//     // test('Fetch Movie Details', () async {
//     //   final movieId = 1;
//     //   final movieDetails = Movie(id: movieId, );
//     //
//     //   // Prepare mock movie details
//     //   when(mockMovieService.getMovieDetails(movieId: movieId))
//     //       .thenAnswer((_) async => movieDetails);
//     //
//     //   // Fetch movie details
//     //   await movieStore.getMoviesDetails(movieId);
//     //
//     //   // Verify that the movie details are correct
//     //   expect(movieStore.movieDetails?.title, 'Movie Details');
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockMovieService.getMovieDetails(movieId: movieId)).called(1);
//     // });
//
//     // test('Get Trailers for a Movie', () async {
//     //   final trailer = Trailer(id: "1",);
//     //
//     //   // Prepare mock trailers
//     //   when(mockMovieService.getTrailer(movieId: 1))
//     //       .thenAnswer((_) async => [trailer]);
//     //
//     //   // Trigger fetching trailers
//     //   await movieStore.getTrailers();
//     //
//     //   // Verify trailers are fetched
//     //   expect(movieStore.trailers?.length, 1);
//     //   expect(movieStore.trailers?[0].key, 'trailer-key');
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockMovieService.getTrailer(movieId: 1)).called(1);
//     // });
//
//     // test('Search Movies', () async {
//     //   final query = 'Movie';
//     //   final searchResults = [Movie(id: 1,)];
//     //
//     //   // Prepare mock search results
//     //   when(mockMovieService.getSearchedMovie(query: query, pageNo: 1))
//     //       .thenAnswer((_) async => {'data': searchResults, 'page': 1, 'total_pages': 1});
//     //
//     //   // Trigger the search action
//     //   await movieStore.getSearchedMovie(query: query, isQueryNew: true);
//     //
//     //   // Verify that the search results are populated
//     //   expect(movieStore.searchedMovies.length, 1);
//     //   expect(movieStore.searchedMovies[0].title, 'Searched Movie');
//     //
//     //   // Verify that the mock method was called
//     //   verify(mockMovieService.getSearchedMovie(query: query, pageNo: 1)).called(1);
//     // });
//   });
// }
