import 'package:finance_house_task/model/movie/cache_data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../model/movie/movie.dart';

class IsarService {
  IsarService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory IsarService() => _instance;

  late Isar isar; // Isar instance for local database
  static final IsarService _instance = IsarService._internal();

  // Function to initialize the Isar database
  // This sets up the Isar instance and opens the database with the Movie schema
  Future<void> initializeIsar() async {
    final dir =
    await getApplicationDocumentsDirectory(); // Get the application's documents directory
    isar = await Isar.open([MovieSchema,CacheDataSchema],
        directory: dir.path); // Open the Isar database with the Movie schema
  }

}