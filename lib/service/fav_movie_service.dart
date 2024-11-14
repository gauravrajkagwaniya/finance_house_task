import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/service/isar_service.dart';
import 'package:isar/isar.dart';

import '../model/movie/cache_data.dart';
import '../model/movie/movie.dart';
import '../utils/enum.dart';

class FavMovieService {
  FavMovieService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory FavMovieService() => _instance;

  static final FavMovieService _instance = FavMovieService._internal();

  Isar get isar => IsarService().isar;
  // Function to retrieve all favorite movies from the Isar database
  // Returns a list of Movie objects
  Future<List<Movie>> getAllFavMovie() async {
    return await isar.movies
        .where()
        .findAll(); // Fetch all movies stored in the database
  }

  // Function to remove a movie from the list of favorite movies
  // It deletes the movie from the Isar database based on its ID
  Future<void> removeFavMovie(Movie? movie) async {
    await isar.writeTxn(() async {
      if (movie != null) {
        isar.movies.delete(movie.id); // Delete the movie from the database
      }
    });
  }

  // Function to add a movie to the list of favorite movies
  // It saves the movie to the Isar database
  Future<void> addFavMovie({Movie? movie, bool? isFav = true}) async {
    await isar.writeTxn(() async {
      if (movie != null) {
        isar.movies.put(movie); // Add or update the movie in the database
      }
    });
  }

}
