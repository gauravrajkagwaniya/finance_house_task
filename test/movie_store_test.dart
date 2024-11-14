import 'package:flutter_test/flutter_test.dart';
import 'package:finance_house_task/store/movie_store.dart';
import 'package:finance_house_task/service/movie_service.dart';
import 'package:mockito/mockito.dart';

import 'package:finance_house_task/model/movie/movie.dart';

import 'mocks/mock_services.dart';

// Create Mock classes for the service
class MockMovieService extends Mock implements MovieService {}

void main() {
  // Create the mock movie service
  late MockMovieService mockMovieService;
  late MovieStore movieStore;
  late MockRootStore mockRootStore;

  setUp(() {
    // Initialize the mock service and store before each test
    mockMovieService = MockMovieService();
    mockRootStore = MockRootStore();
    movieStore = MovieStore(rootStore: mockRootStore);
  });

  group('MovieStore Tests', () {
    // test('Initial state', () {
    //   expect(movieStore.isLoadingPopular, false);
    // });

    test('Fetch Popular Movies', () async {
      // Mock the service response
      // final mockResponse = {
      //   "results": [
      //     {
      //       "adult": false,
      //       "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
      //       "genre_ids": [878, 28, 12],
      //       "id": 912649,
      //       "original_language": "en",
      //       "original_title": "Venom: The Last Dance",
      //       "overview":
      //       "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
      //       "popularity": 3685.151,
      //       "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
      //       "release_date": "2024-10-22",
      //       "title": "Venom: The Last Dance",
      //       "video": false,
      //       "vote_average": 6.403,
      //       "vote_count": 675
      //     },
      //   ]
      // };

      /// Trigger the fetch
      await movieStore.getPopularMovies();
      //
      // // Validate that the movie store has the correct data
      expect(movieStore.isLoadingPopular, true);

    });
    test('Fetch top rated Movies', () async {
      // Mock the service response
      // final mockResponse = {
      //   "results": [
      //     {
      //       "adult": false,
      //       "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
      //       "genre_ids": [878, 28, 12],
      //       "id": 912649,
      //       "original_language": "en",
      //       "original_title": "Venom: The Last Dance",
      //       "overview":
      //       "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
      //       "popularity": 3685.151,
      //       "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
      //       "release_date": "2024-10-22",
      //       "title": "Venom: The Last Dance",
      //       "video": false,
      //       "vote_average": 6.403,
      //       "vote_count": 675
      //     },
      //   ]
      // };

      /// Trigger the fetch
      await movieStore.getTopRated();
      //
      // // Validate that the movie store has the correct data
      expect(movieStore.isLoadingTopRated, true);

    });
    test('Fetch now playing Movies', () async {
      // Mock the service response
      // final mockResponse = {
      //   "results": [
      //     {
      //       "adult": false,
      //       "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
      //       "genre_ids": [878, 28, 12],
      //       "id": 912649,
      //       "original_language": "en",
      //       "original_title": "Venom: The Last Dance",
      //       "overview":
      //       "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
      //       "popularity": 3685.151,
      //       "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
      //       "release_date": "2024-10-22",
      //       "title": "Venom: The Last Dance",
      //       "video": false,
      //       "vote_average": 6.403,
      //       "vote_count": 675
      //     },
      //   ]
      // };

      /// Trigger the fetch
      await movieStore.getNowPlaying();
      //
      // // Validate that the movie store has the correct data
      expect(movieStore.isLoadingNowPlaying, true);

    });

    test('is all 3 api fetched', () async {
      // Mock the service response
      // final mockResponse = {
      //   "results": [
      //     {
      //       "adult": false,
      //       "backdrop_path": "/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg",
      //       "genre_ids": [878, 28, 12],
      //       "id": 912649,
      //       "original_language": "en",
      //       "original_title": "Venom: The Last Dance",
      //       "overview":
      //       "Eddie and Venom are on the run. Hunted by both of their worlds and with the net closing in, the duo are forced into a devastating decision that will bring the curtains down on Venom and Eddie's last dance.",
      //       "popularity": 3685.151,
      //       "poster_path": "/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
      //       "release_date": "2024-10-22",
      //       "title": "Venom: The Last Dance",
      //       "video": false,
      //       "vote_average": 6.403,
      //       "vote_count": 675
      //     },
      //   ]
      // };

      /// Trigger the fetch
      await movieStore;
      //
      // // Validate that the movie store has the correct data
      expect(movieStore.isAllLoaded, true);

    });





  });
}
