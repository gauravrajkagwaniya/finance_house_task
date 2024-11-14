import 'package:finance_house_task/service/preference_service.dart';
import 'package:finance_house_task/store/root_store.dart';
import 'package:mockito/mockito.dart';
import 'package:finance_house_task/service/movie_service.dart';

import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/model/movie/trailer.dart';

// Mock MovieService
class MockMovieService extends Mock implements MovieService {}

// Mock PreferencesService
class MockPreferencesService extends Mock implements PreferencesService {}

// Mock RootStore
class MockRootStore extends Mock implements RootStore {}