import 'package:finance_house_task/service/isar_service.dart';
import 'package:isar/isar.dart';
import '../model/movie/movie.dart';

class FavMovieService {
  FavMovieService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory FavMovieService() => _instance;

  static final FavMovieService _instance = FavMovieService._internal();

  // Function to retrieve all favorite movies from the Isar database
  // Returns a list of Movie objects
  Future<List<Movie>> getAllFavMovie() async {
    return await IsarService().getAllMovies(); // Fetch all movies stored in the database
  }

  // Function to remove a movie from the list of favorite movies
  // It deletes the movie from the Isar database based on its ID
  Future<void> removeFavMovie(Movie? movie) async {
    if(movie!=null){
      await IsarService().deleteMovie(movie);
    }
  }

  // Function to add a movie to the list of favorite movies
  // It saves the movie to the Isar database
  Future<void> addFavMovie({Movie? movie}) async {
    if(movie!=null){
      await IsarService().addMovie(movie);
    }
  }

}
