import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/service/fav_movie_service.dart';
import 'package:mockito/annotations.dart';

// Generate mock classes for MovieService and FavMovieService
@GenerateMocks([FavMovieService])
class FavoriteService {
  Future<List<Movie>> getAllFavMovie() async {
    UtilMethods.kPrintMessage("mock fav ");
    return [];
  }

  Future<void> removeFavMovie(Movie movie) async {
    return;
  }

  Future<void> addFavMovie(Movie movie) async {
    return;
  }
}
