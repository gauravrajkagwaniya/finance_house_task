import 'package:finance_house_task/service/cache_service.dart';
import 'package:finance_house_task/service/isar_service.dart';
import 'package:finance_house_task/service/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';

import 'app_config.dart';
import 'main.dart';

Future<void> main() async {
  setupEnv(Environment.prod);

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await IsarService().initializeIsar();
  await CacheService().initCacheImg();
  runApp(const MyApp());
}
