import 'dart:convert';

import 'package:finance_house_task/model/movie/cache_data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/movie/movie.dart';
import '../utils/enum.dart';
import '../utils/util_methods.dart';

class IsarService {
  IsarService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory IsarService() => _instance;

  late Isar _isar; // Isar instance for local database
  static final IsarService _instance = IsarService._internal();

  // Function to initialize the Isar database
  // This sets up the Isar instance and opens the database with the Movie schema
  Future<void> initializeIsar() async {
    final dir =
        await getApplicationDocumentsDirectory(); // Get the application's documents directory
    _isar = await Isar.open([MovieSchema, CacheDataSchema],
        directory: dir.path); // Open the Isar database with the Movie schema
  }

  Future<List<Movie>> getAllMovies() async {
    return await _isar.movies.where().findAll();
  }

  Future<void> deleteMovie(Movie movie) async {
    await _isar.writeTxn(() async {
      _isar.movies.delete(movie.id); // Delete the movie from the database
    });
  }

  Future<void> addMovie(Movie movie) async {
    await _isar.writeTxn(() async {
      _isar.movies.put(movie); // Add or update the movie in the database
    });
  }

  // save res to cache
  Future<void> saveResToCache(
      MovieSectionsEnum section, String url, String res) async {
    try {
      final cache = CacheData()
        ..apiUrl = url
        ..response = res;
      await _isar.writeTxn(() async {
        await _isar.cacheDatas.put(cache);
      });
      UtilMethods.kPrintMessage("isar by url save cache:: $cache ");
    } catch (e) {
      UtilMethods.kPrintMessage("error  url isar save cache:: $e ");
    }
  }

  Future<Map<String, dynamic>?> getResFromCache(String url) async {
    try {
      final cachedData = await _isar.cacheDatas
          .filter()
          .apiUrlEqualTo(url)
          .findFirst(); // Retrieve cached data for this URL
      UtilMethods.kPrintMessage("isar by $url get cache:: $cachedData ");
      if (cachedData != null) {
        return json.decode(cachedData.response);
      }
    } catch (e) {
      UtilMethods.kPrintMessage("error  $url isar get cache:: $e ");
    }
    return null;
  }
}
