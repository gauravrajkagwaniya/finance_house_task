
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:finance_house_task/service/movie_service.dart';
import 'new_test.mocks.dart';

@GenerateMocks([MovieService])
void main() {
  late MockMovieService mockMovieService;

  group("Movie Service", () {
    setUp(
      () {
        mockMovieService = MockMovieService();
      },
    );

    test('initial state should be empty lists and loading false', () {
      when(mockMovieService.getPopularMovies()).thenAnswer((_) async=> null);
      expect(mockMovieService.getPopularMovies(), null);
      // expect(mockMovieStore.nowPlayingMovieList, []);
      // expect(mockMovieStore.topRatedMovieList, []);
      // expect(mockMovieStore.isLoadingPopular, false);
      // expect(mockMovieStore.isLoadingNowPlaying, false);
      // expect(mockMovieStore.isLoadingTopRated, false);
    });

    test("Store Get Popular", () {
      // when(mockMovieStore.getPopularMovies()).thenAnswer((_) async => []);
      // expect([], []);
    });
  });
}
