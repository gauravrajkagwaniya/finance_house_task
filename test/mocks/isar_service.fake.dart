import 'package:finance_house_task/model/movie/movie.dart';
import 'package:finance_house_task/utils/enum.dart';
import 'package:finance_house_task/utils/util_methods.dart';
import 'package:mockito/annotations.dart';

// Generate mock classes for IsarService
List<Movie> mockMovies = [
  Movie(id: 1,),
  Movie(id: 2,),
];
@GenerateMocks([IsarService])
class IsarService {
  Future<void> initializeIsar() async {
    UtilMethods.kPrintMessage("initializeIsar ");
  }


  Future<List<Movie>> getAllMovies()async{
    return mockMovies;
  }

  Future<void> deleteMovie(Movie movie) async {
    mockMovies.remove(movie);
  }

  Future<void> addMovie(Movie movie) async {
    mockMovies.remove(movie);
  }

  // save res to cache
  Future<void> saveResToCache(MovieSectionsEnum section, String url, String res) async {
    return;
  }

  Future<Map<String, dynamic>?> getResFromCache(String url) async {
    return {};
  }





}


