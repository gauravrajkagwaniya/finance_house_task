import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/service/fav_movie_service.dart';
import 'package:mockito/annotations.dart';

import 'isar_service.fake.mocks.dart';



// Generate mock classes for  FavMovieService
@GenerateMocks([FavMovieService])
class FavMovieService  {

  Future<List<Movie>> getAllFavMovie() async {
    return await MockIsarService().getAllMovies();
  }

  Future<void> removeFavMovie(Movie movie) async {
    MockIsarService().deleteMovie(movie);
  }

  Future<void> addFavMovie(Movie movie) async {
    MockIsarService().addMovie(movie);
  }
}
