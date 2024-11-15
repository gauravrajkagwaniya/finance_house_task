import 'package:path_provider/path_provider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';

class ImageCacheService {
  ImageCacheService._internal();

  // Singleton pattern: Provides a single instance of CacheService
  factory ImageCacheService() => _instance;

  static final ImageCacheService _instance = ImageCacheService._internal();


  Future<void> initCacheImg() async {
    String storageLocation = (await getApplicationDocumentsDirectory()).path;
    await FastCachedImageConfig.init(
        subDir: storageLocation, clearCacheAfter: const Duration(days: 15));
  }


}
