import 'dart:convert';

import 'package:finance_house_task/global.dart';
import 'package:finance_house_task/service/isar_service.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import '../model/movie/cache_data.dart';
import '../utils/enum.dart';

class CacheService {
  CacheService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory CacheService() => _instance;

  static final CacheService _instance = CacheService._internal();

  Isar get isar => IsarService().isar;
  static String nowPlayingDataKey = "/movie/now_playing/1";
  static String popularDataKey = "/movie/popular/1";
  static String topRatedDataKey = "/movie/top_rated/1";

  Future<void> initCacheImg() async {
    String storageLocation = (await getApplicationDocumentsDirectory()).path;
    await FastCachedImageConfig.init(
        subDir: storageLocation, clearCacheAfter: const Duration(days: 15));
  }

  // save res to cache
  Future<void> saveResToCache(
      MovieSectionsEnum section, String url, String res) async {
    try {
      final cache = CacheData()
        ..apiUrl = url
        ..response = res;
      await isar.writeTxn(() async {
        await isar.cacheDatas.put(cache);
      });
      UtilMethods.kPrintMessage("isar by url save cache:: $cache ");
    } catch (e) {
      UtilMethods.kPrintMessage("error  url isar save cache:: $e ");
    }
  }

  Future<Map<String, dynamic>?> getResFromCache(String url) async {
    try {
      final cachedData = await isar.cacheDatas
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
