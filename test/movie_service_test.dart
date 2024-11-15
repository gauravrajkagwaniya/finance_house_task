import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/model/movie/trailer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'mocks/movie_service.fake.dart';
import 'mocks/movie_service.fake.mocks.dart';

Map<String, dynamic> accepted = {
  "data": [Movie.fromJson(response)],
  "page": 1
};
List<Trailer> mockTrailer = [Trailer.fromJson(trailerResponse)];

Map<String, dynamic> emptyResult = {};

void main() {
  group("Movie Service", () {
    // late RootStore rootStore;
    late MovieService mockMovieService;
    // late MockFavMovieService mockFavMovieService;

    setUp(() {
      mockMovieService = MockMovieService();
      // mockFavMovieService = MockFavMovieService();
      // when(mockFavMovieService.getAllFavMovie()).thenAnswer((_) async => []);
      // rootStore = RootStore();
    });

    group("Movie Service:: init all request have empty list", () {
      test("should have empty movie list for popular movies", () async {
        when(mockMovieService.getPopularMovies())
            .thenAnswer((_) async => emptyResult);
        // Call the method
        var result = await mockMovieService.getPopularMovies();
        // Verify that the result is an empty list
        expect(result, isEmpty);
      });

      test("should have empty movie list for top rated movies", () async {
        when(mockMovieService.getTopRated())
            .thenAnswer((_) async => emptyResult);
        // Call the method
        var result = await mockMovieService.getTopRated();
        // Verify that the result is an empty list
        expect(result, isEmpty);
      });

      test("should have empty movie list for now playing movies", () async {
        when(mockMovieService.getNowPlaying())
            .thenAnswer((_) async => emptyResult);
        // Call the method
        var result = await mockMovieService.getNowPlaying();
        // Verify that the result is an empty list
        expect(result, isEmpty);
      });
    });

    group("Movie Service:: API request and check mocked data ", () {

      test("API request and check mocked data for popular movies", () async {
        // Stub the method to return an empty list
        when(mockMovieService.getPopularMovies())
            .thenAnswer((_) async => accepted);

        // Call the method
        var res = await mockMovieService.getPopularMovies();
        // Verify that the result is an empty list
        expect(accepted, res);
      });

      test("API request and check mocked data for top rated movies", () async {

        when(mockMovieService.getTopRated()).thenAnswer((_) async => accepted);
        // Call the method
        var result = await mockMovieService.getTopRated(pageNo: 1);
        // Verify that the result is an empty list
        expect(accepted, result);
      });

      test("API request and check mocked data for now playing movies",
          () async {
        when(mockMovieService.getNowPlaying())
            .thenAnswer((_) async => accepted);
        // Call the method
        var result = await mockMovieService.getNowPlaying(pageNo: 1);
        // Verify that the result is an empty list
        expect(accepted, result);
      });
    });

    group("Movie Service:: Search API reuest and response", () {

      test('getSearchedMovie should return parsed movie data based on query',
          () async {
        // Mock the API response

        // when(mockMovieService.getSearchedMovie(pageNo: 1, query:))).thenAnswer((_) async => mockResponse);
        when(mockMovieService.getSearchedMovie(pageNo: 1, query: "Terr"))
            .thenAnswer((_) async => accepted);
        final result =
            await mockMovieService.getSearchedMovie(query: 'Terr', pageNo: 1);

        // Assertions to check the expected behavior
        expect(result, isNotNull);
        expect(result?['data'], isNotEmpty);
      });
    });

    group("Movie Service:: Get Movie", () {

      test(' Get Movie should return parsed movie data based on query',
          () async {
        // Mock the API response
        when(mockMovieService.getMovieDetails(1034541))
            .thenAnswer((_) async => Movie.fromJson(response));
        final result = await mockMovieService.getMovieDetails(1034541);
        // Assertions to check the expected behavior
        expect(result, isNotNull);

      });
    });
  });
}
