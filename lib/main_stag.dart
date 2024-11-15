import 'package:finance_house_task/service/image_cache_service.dart';
import 'package:finance_house_task/service/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_config.dart';
import 'main.dart';

Future<void> main() async {
  setupEnv(Environment.stag);

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await IsarService().initializeIsar();
  await ImageCacheService().initCacheImg();
  runApp(const MyApp());
}
