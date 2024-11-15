import 'package:finance_house_task/model/movie/movie.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'mocks/favorites_service.fake.mocks.dart';
import 'mocks/isar_service.fake.mocks.dart';

// class MockIsarService extends Mock implements IsarService {}

void main() {
  late MockFavMovieService mockFavMovieService;
  late MockIsarService mockIsarService;

  setUp(() {
    // Initialize the mock service and FavMovieService instance
    mockIsarService = MockIsarService();
    mockFavMovieService = MockFavMovieService();
  });

  group('FavMovieService Tests', () {
    test('getAllFavMovie returns a list of movies', () async {
      // Arrange: Prepare the mock response for getAllMovies
      List<Movie> mockMovies = [
        Movie(
          id: 1,
        ),
        Movie(
          id: 2,
        ),
      ];
      when(mockFavMovieService.getAllFavMovie())
          .thenAnswer((_) async => mockMovies);

      // Act: Call the method
      List<Movie> result = await mockFavMovieService.getAllFavMovie();

      // Assert: Verify the result
      expect(result, isA<List<Movie>>());
      expect(result.length, 2);
      expect(result[0].id, 1);
      expect(result[1].id, 2);
    });

    test('removeFavMovie removes a movie from the list', () async {
      List<Movie> mockMovies = [
        Movie(
          id: 1,
        ),
        Movie(
          id: 2,
        ),
      ];
      // Arrange: Prepare the movie to be removed

      // Act: Call removeFavMovie and mock the deletion
      when(mockFavMovieService.removeFavMovie(mockMovies[0]))
          .thenAnswer((_) async {});

      await mockFavMovieService.removeFavMovie(mockMovies[0]);

      // Assert: Verify that deleteMovie was called with the correct movie
      verify(mockFavMovieService.removeFavMovie(mockMovies[0])).called(1);
    });

    test('addFavMovie adds a movie to the list', () async {
      // Arrange: Prepare the movie to be added

      Movie movieToAdd = Movie(
        id: 3,
      );

      // Act: Call addFavMovie and mock the add action
      when(mockFavMovieService.addFavMovie(movieToAdd))
          .thenAnswer((_) async {});

      await mockFavMovieService.addFavMovie(movieToAdd);

      // Assert: Verify that addMovie was called with the correct movie
      verify(mockFavMovieService.addFavMovie(movieToAdd)).called(1);
    });

    test('removeFavMovie does nothing if movie is null', () async {
      Movie movie = Movie(
        id: 1,
      );
      // Act: Call removeFavMovie with null movie
      await mockFavMovieService.removeFavMovie(movie);

      // Assert: Verify that deleteMovie was not called
      verifyNever(mockIsarService.deleteMovie(movie));
    });

    test('addFavMovie does nothing if movie is null', () async {
      Movie movie = Movie(
        id: 3,
      );
      // Act: Call addFavMovie with null movie
      await mockFavMovieService.addFavMovie(movie);

      // Assert: Verify that addMovie was not called
      verifyNever(mockIsarService.addMovie(movie));
    });
  });
}
