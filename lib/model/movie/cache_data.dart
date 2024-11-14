import 'package:isar/isar.dart';

import '../../utils/enum.dart';


part 'cache_data.g.dart';

@collection
class CacheData {
  Id id = Isar.autoIncrement;

  //key
  late String apiUrl;
  //string
  late String response;

  @enumerated
  late MovieSectionsEnum movieCategoryEnum = MovieSectionsEnum.nowPlaying;


}
