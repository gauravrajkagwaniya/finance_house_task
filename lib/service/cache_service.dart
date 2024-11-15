
import 'package:finance_house_task/service/isar_service.dart';
import '../utils/enum.dart';

class CacheService {
  CacheService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory CacheService() => _instance;

  static final CacheService _instance = CacheService._internal();

  static String nowPlayingDataKey = "/movie/now_playing/1";
  static String popularDataKey = "/movie/popular/1";
  static String topRatedDataKey = "/movie/top_rated/1";

  // save res to cache
  Future<void> saveResToCache(MovieSectionsEnum section, String url, String res) async {
    await IsarService().saveResToCache(section, url, res);
  }

  Future<Map<String, dynamic>?> getResFromCache(String url) async {
    return await IsarService().getResFromCache(url);
  }
}
